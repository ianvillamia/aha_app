import 'package:aha_app/Providers/devotinalProvider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:aha_app/Providers/navigationProvider.dart';

class AhaBody extends StatefulWidget {
  AhaBody({Key key}) : super(key: key);

  @override
  _AhaBodyState createState() => _AhaBodyState();
}

class _AhaBodyState extends State<AhaBody> {
  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever
    // then
    return true; // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    final _devotionalProvider =
        Provider.of<DevotionProvider>(context, listen: false);
    var size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * .1, horizontal: size.width * .05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header(title: 'Day-68'),
                    SizedBox(height: size.height * .03),
                    section(
                        size: size,
                        text: 'Awareness',
                        bodyText: _devotionalProvider.awarenessController.text),
                    SizedBox(height: size.height * .03),
                    section(
                        size: size,
                        text: 'Honesty',
                        bodyText: _devotionalProvider.honestyController.text),
                    SizedBox(height: size.height * .03),
                    section(
                        size: size,
                        text: 'Action',
                        bodyText: _devotionalProvider.actionController.text)
                  ],
                ),
              )),
        ),
      ),
    );
  }

  header({@required String title}) {
    return Text(
      title,
      style: GoogleFonts.quicksand(
          textStyle: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
    );
  }

  section({@required size, @required String text, @required String bodyText}) {
    return Column(
      children: [
        Row(
          children: [
            Text(text),
            Tooltip(
                message: 'Click box below to add $text',
                child: IconButton(
                    icon: Icon(FlutterIcons.question_ant), onPressed: () {})),
          ],
        ),
        Material(
          color: Color.fromRGBO(235, 233, 233, 1),
          child: InkWell(
            splashColor: Colors.blue,
            onTap: () {},
            child: Container(
              //   color: Color.fromRGBO(235, 233, 233, 1),
              width: size.width,
              height: size.height * .15,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  bodyText,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
