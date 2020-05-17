import 'package:aha_app/Providers/navigationProvider.dart';
import 'package:aha_app/Widgets/bottomBar.dart';
import 'package:aha_app/Widgets/fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:provider/provider.dart';

class EveningDevotion extends StatefulWidget {
  @override
  _EveningDevotionState createState() => _EveningDevotionState();
}

class _EveningDevotionState extends State<EveningDevotion> {
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
    final _navigationProvider = Provider.of<NavigationProvider>(context);
    _navigationProvider.selected = 2;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Positioned(top: 20, child: header(size: size)),
            Positioned(top: size.height * .25, child: body(size: size))
          ],
        ),
      ),
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomBar(),
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
                    image: AssetImage('assets/moon-icon.png'),
                    fit: BoxFit.contain)),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: boldText(text: 'Evening Devotion', fontSize: 30)),
          )
        ],
      ),
    );
  }

  body({@required size}) {
    return FutureBuilder(
      future: _makeRequest,
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData &&
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
        }
        else {
            return Container(
              height: size.height*.5,
               width: size.width,
                 color: Color.fromRGBO(255, 249, 249, 1),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                    ),
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
    String url =
        'https://ajith-holy-bible.p.rapidapi.com/GetChapter?Book=Genesis&chapter=8';
    var response = await http.get(Uri.encodeFull(url), headers: {
      "x-rapidapi-host": "ajith-holy-bible.p.rapidapi.com",
      "x-rapidapi-key": "99cc147856msh74933134b391c20p1d97b4jsn5ca11ec7e543"
    });
    if (response.statusCode == 200) {
      // return convert.jsonDecode(response.body);

      dynamic body = convert.jsonDecode(response.body);
      // BibleModel.fromJson(body);
      // print(body['Book']);
      setState(() {
        output = body['Output'];
        chapter = body['Chapter'];
        book = body['Book'];
      });
      return convert.jsonDecode(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return null;
  }
}
