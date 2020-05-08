import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aha_app/bottomBar.dart';

class MorningDevotion extends StatefulWidget {
  @override
  _MorningDevotionState createState() => _MorningDevotionState();
}

class _MorningDevotionState extends State<MorningDevotion> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Stack(
          children: <Widget>[Positioned(top: 20, child: header(size: size)),
          Positioned(
            top: size.height*.25,
            child:body(size: size) )],
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
                    image: AssetImage('assets/sun-icon.png'),
                    fit: BoxFit.contain)),
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
  body({@required size}){
    return Container(
      color: Color.fromRGBO(255,249,249,1),
      width: size.width,
      height: size.height*.6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                boldText(text: 'morning: Jeremiah 2', fontSize: 20),
               Padding(padding: EdgeInsets.symmetric(horizontal: 25),child:  boldText(text: 'Israel Forsakes the Lord,2 The Word of the Lord came to me,saying,"Go and proclaim in the hearing of Jerusamlem,Thus Says the Lord,I remember the devotion of your youth,your love as a bride,how you followed me in the wilderness,in a land not sown..lorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsumlorem ipsum', fontSize: 20),)
               
              ],
            ),
          ),
        ),
      ),
    );
  }
  boldText({@required String text, @required double fontSize}){
    return Text(text,style: GoogleFonts.quicksand(
                textStyle: TextStyle(fontSize: fontSize,fontWeight: FontWeight.bold)
              ),);
  }
  }
