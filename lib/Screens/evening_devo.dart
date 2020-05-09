import 'package:aha_app/Widgets/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EveningDevotion extends StatefulWidget {
  @override
  _EveningDevotionState createState() => _EveningDevotionState();
}

class _EveningDevotionState extends State<EveningDevotion> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(FontAwesomeIcons.moon,
              size: 25.0,
              color: Colors.white,
            )
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF000000),
        title: Text('Evening Devotional ',
          style: GoogleFonts.pacifico(
              textStyle: TextStyle(color: Colors.white),
              fontSize: 25.0,
            ),
          
          ),
        elevation: 0.0,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(),
        child: Column(
          children: [
            Center(
              child: Text('Jeremiah 02 English Standard Version (ESV)',
                style: GoogleFonts.pacifico(
                  textStyle: TextStyle(color: Color(0xFF110133)),
                  fontSize: 22.0,
                )
              ),
            ),
            Text('''
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
                  sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris 
                  nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate 
                  velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
                  sunt in culpa qui officia deserunt mollit anim id est laborum.''',
                  style: GoogleFonts.quicksand(
                            fontSize: 15.0,
                            textStyle: TextStyle(color: Color(0xFF110133)),
                          ),
                        )
          ],
        ),  
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}