import 'package:aha_app/Providers/navigationProvider.dart';
import 'package:aha_app/Widgets/bibleVersion.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:provider/provider.dart';

class MorningDevotion extends StatefulWidget {
  @override
  _MorningDevotionState createState() => _MorningDevotionState();
}

class _MorningDevotionState extends State<MorningDevotion> {
  Future _makeRequest;
  @override
  void initState() {
    super.initState();
    _makeRequest = makeRequest();
  }

  String output = '';
  String book = '';
  String chapter = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Positioned(top: 20, child: header(size: size)),
            Positioned(top: size.height * .25, child: body(size: size)),
          ],
        ),
      ),
    );
  }

  header({@required size}) {
    return Container(
      width: size.width,
      height: size.height * .2,
      //color: Colors.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            width: size.width * .3,
            height: size.height * .13,
            decoration: BoxDecoration(
                //color: Colors.white,
                image: DecorationImage(
                    image: AssetImage('assets/sun.png'), fit: BoxFit.contain)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: boldText(text: 'Morning Devotion', fontSize: 30)),
          )
        ],
      ),
    );
  }

  body({@required size}) {
    return FutureBuilder(
      future: _makeRequest,
      builder: (context, snapshot) {
        print(snapshot.connectionState);
        print(snapshot.hasData);
        print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.done ||
            snapshot.hasData ||
            snapshot.data != null) {
          return Container(
            color: Color.fromRGBO(255, 249, 249, 1),
            width: size.width,
            height: size.height * .6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      boldText(text: book + " " + chapter, fontSize: 35),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: boldText(text: output, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container(
            height: size.height * .5,
            width: size.width,
            color: Color.fromRGBO(255, 249, 249, 1),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Please wait..getting data')
                ],
              ),
            ),
          );
        }
      },
    );
  }

  boldText({@required String text, @required double fontSize}) {
    return Text(
      text,
      style: GoogleFonts.quicksand(
          textStyle:
              TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
    );
  }
  //le potato

  Future<dynamic> makeRequest() async {
    print('fetching');
    // String url = 'https://api.esv.org/v3/passage/text/?q=John+11';
    var uri = Uri.parse('https://api.esv.org/v3/passage/text');
    uri = uri.replace(queryParameters: <String, String>{
      'q': 'John+11',
      'indent-using': '    ',
      'indent-paragraphs': '2',
      'include-footnotes': 'false',
      'include-first-verse-numbers': 'false',
      // 'include-headings':'false',
      'include-short-copyright': 'false'
    });
    print(uri);
    var response = await http.get(uri, headers: {
      'Authorization': 'c0d6f0b7a1bedbbcdf0aeeb77377d14c79e78c5e'
      //  "x-rapidapi-host": "ajith-holy-bible.p.rapidapi.com",
      //  "x-rapidapi-key": "99cc147856msh74933134b391c20p1d97b4jsn5ca11ec7e543"
    });
    if (response.statusCode == 200) {
      // return convert.jsonDecode(response.body);

      dynamic body = convert.jsonDecode(response.body);
      // BibleModel.fromJson(body);
      // print(body['Book']);
      print(body['passages']);
      setState(() {
        // print('calling setstate');
        // chapter = 'chapter';
        //book = 'book';
        var listToString = body['passages'].toString();
        //   print(body['passages'].runtimeType);
        output = listToString.replaceFirst("[", '');
        // output = body['Output'];
        // chapter = body['Chapter'];
        // book = body['Book'];
      });
      return body;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }
}
