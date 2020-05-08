import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:aha_app/bottomBar.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Devotional',
          style: GoogleFonts.pacifico(
              textStyle: TextStyle(color: Color(0xFF110133)),
              fontSize: 25.0,
            ),
          ),
        elevation: 0.0,
      ),

      body: Container(
        width: size.width,
        height: size.height,
      
        child: Column(
          children: [
            buildButton(function: (){}, 
              size: size,color: Color(0xFFFFDC34), 
              icon: FontAwesomeIcons.sun, 
              text: 'Morning Reading'),
            SizedBox(height: 50,),

            buildButton(function: (){},
            size:size,color: Color(0xFF00918e),
            icon: FontAwesomeIcons.moon, text: 'Evening Reading'),
            SizedBox(height: 50,),
            buildButton(function: (){},size:size,color: Color(0xFF4DD599),icon: FontAwesomeIcons.calendarCheck,text: 'Today’s Devotion'),
            
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
  buildButton({@required Function function, @required size, @required IconData icon, @required String text, @required Color color}){
    return Material(
          color: color,
          child: InkWell(
            onTap:function,
            splashColor: Colors.blue,
                child: Container(
                width: size.width,
                height: size.height*.1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(icon,
                    size: 42.0,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(text,
                    style: GoogleFonts.quicksand(
                      textStyle: TextStyle(color: Color(0xFF110133)),
                      fontSize: 25.0,
                    ),
                    )
                ],),
              ),
            ),
          );
  }
}
