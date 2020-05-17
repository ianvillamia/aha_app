import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class AhaMessage extends StatefulWidget {
  final title;
  AhaMessage({@required this.title});

  @override
  _AhaMessageState createState() => _AhaMessageState();
}

class _AhaMessageState extends State<AhaMessage> {
  String title;
  String subtext;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = widget.title;
    switch (title.toLowerCase()) {
      case 'awareness':
        subtext = 'What is God trying to tell me?';

        break;
      case 'honesty':
        subtext = 'What are the truths I have to accept and confess?';
        break;
      case 'action':
        subtext = 'What must I do now?';
        break;

      default:
        subtext = 'error loading title please try again';
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .05, vertical: size.height * .1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 35,
                  ),
                  onPressed: () => Navigator.pop(context)),
              SizedBox(
                height: size.height * .03,
              ),
              body(size: size)
            ],
          ),
        ),
      ),
    );
  }

  body({@required size}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.quicksand(
                  fontSize: 30, fontWeight: FontWeight.bold)),
          Opacity(
              opacity: .5,
              child: Text(
                subtext,
                style: TextStyle(decoration: TextDecoration.underline),
              )),
          Card(
              child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 8,
              decoration:
                  InputDecoration.collapsed(hintText: "Enter your text here"),
            ),
          )),
          Align(
              alignment: Alignment.bottomRight,
              child: ClipOval(
                  child: IconButton(
                icon: Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                color: Colors.blue,
                onPressed: () {
                  //save function 
                  Navigator.pop(context);
                },
              )))
        ],
      ),
    );
  }
}
