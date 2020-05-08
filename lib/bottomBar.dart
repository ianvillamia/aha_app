import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar( 
      currentIndex: selected,
      onTap: (index){
        setState(() {
          selected=index;
          print(selected);
        });
      },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem( 
            icon: Icon(FontAwesomeIcons.home),
            title: Text('Home',
                    style: GoogleFonts.quicksand(
                            textStyle: TextStyle(color: Color(0xFF110133)),
                          ),
                      ),
        ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bible),
            title: Text('Read',
                    style: GoogleFonts.quicksand(
                              textStyle: TextStyle(color: Color(0xFF110133)),
                              ),
                            ),
        ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.book),
            title: Text('Notes',
                    style: GoogleFonts.quicksand(
                                      textStyle: TextStyle(color: Color(0xFF110133)),
                                      ),
                                    ),
                              
          ),
        ],
      );
  }
}