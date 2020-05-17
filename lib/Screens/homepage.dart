import 'package:aha_app/Providers/navigationProvider.dart';
import 'package:aha_app/Widgets/bottomBar.dart';
import 'package:aha_app/Widgets/fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:aha_app/Providers/navigationProvider.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final _navigationProvider = Provider.of<NavigationProvider>(context);
    _navigationProvider.selected = 0;
    var size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text(
          'Aha-Devotion',
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
        color: Color.fromRGBO(241, 216, 192, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customCards(
                      title: 'Morning\nDevotion',
                      image: 'assets/sun-cloud.png',
                      size: size,
                      function: () {
                        _navigationProvider.updateBottomNavigation(
                            val: 1, context: context);
                      }),
                  customCards(
                    title: 'Evening\nDevotion',
                    image: 'assets/moon-stars.png',
                    size: size,
                    function: () {
                      _navigationProvider.updateBottomNavigation(
                          val: 2, context: context);
                    },
                  ),
                ],
              ),
            ),
            Container(
                width: size.width * .7,
                height: size.height * .3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Notes',
                                style: GoogleFonts.quicksand(
                                    textStyle: TextStyle(fontSize: 20)),
                              ),
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 130,
                                  child: Image.asset('assets/edit.png'))),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text('~click me'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomBar(),
    );
  }

  customCards(
      {@required size,
      @required Function function,
      @required String title,
      @required String image}) {
    return Container(
      width: size.width * .45,
      height: size.height * .35,
      child: Card(
        child: InkWell(
          onTap: function,
          splashColor: Colors.blue,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    style: GoogleFonts.quicksand(
                        textStyle: TextStyle(fontSize: 20)),
                  ),
                ),
                Align(alignment: Alignment.center, child: Image.asset(image)),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text('~click me'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
