import 'package:aha_app/Providers/navigationProvider.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_icons/flutter_icons.dart';
class BottomBar extends StatefulWidget {
  BottomBar({Key key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  @override
  Widget build(BuildContext context) {
      final navigationProvider = Provider.of<NavigationProvider>(context);
    return BubbleBottomBar(
      
        opacity: .2,
        currentIndex: navigationProvider.selected,
        onTap: (val) {
          navigationProvider.updateBottomNavigation(val: val,context: context);
        },
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                FlutterIcons.sun_faw5,
                color: Colors.black,
              ),
              activeIcon: Icon(
                 FlutterIcons.sun_faw5,
                color: Colors.deepPurple,
              ),
              title: Text("Morning")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                FlutterIcons.moon_ent,
                color: Colors.black,
              ),
              activeIcon: Icon(
               FlutterIcons.moon_ent,
                color: Colors.indigo,
              ),
              title: Text("Evening")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
             FlutterIcons.notebook_mco,
                color: Colors.black,
              ),
              activeIcon: Icon(
                   FlutterIcons.notebook_mco,
                color: Colors.green,
              ),
              title: Text("Notes"))
        ],
      );
  }
}