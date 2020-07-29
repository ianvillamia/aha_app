import 'package:aha_app/Screens/aha_body.dart';
import 'package:aha_app/Screens/evening_devo.dart';
import 'package:aha_app/Screens/homepage.dart';
import 'package:aha_app/Screens/morning_devo.dart';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:aha_app/Providers/navigationProvider.dart';

class Body extends StatefulWidget {
  var page;
  Body({this.page});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  PageController _pageController;
  var _bottomNavIndex = 0; //default index of first screen

  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.brightness_5,
    Icons.brightness_4,
    Icons.brightness_6,
    Icons.brightness_7,
  ];

  @override
  void initState() {
    super.initState();
    //check if has page meaning the thing is woo
    if (widget.page != null) {
      _pageController = PageController(initialPage: widget.page);
      setState(() {
        _bottomNavIndex = widget.page; //default index of first screen
      });
    } else {
      _pageController = PageController();
      _pageController = PageController(initialPage: 0);
    }

    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Colors.grey,
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => Future.sync(onWillPop),
        child: PageView(
          controller: _pageController,
          children: <Widget>[
            Homepage(),
            MorningDevotion(),
            EveningDevotion(),
            AhaBody()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(FlutterIcons.pencil_alt_faw5s),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  bool onWillPop() {
    if (_pageController.page.round() == _pageController.initialPage)
      return true;
    else {
      _pageController.previousPage(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    }
  }

  _buildBottomNav({BuildContext context}) {
    return AnimatedBottomNavigationBar(
      icons: iconList,
      backgroundColor: Colors.white,
      activeIndex: _bottomNavIndex,
      activeColor: Colors.blue,
      splashColor: Colors.black,
      inactiveColor: Colors.grey,
      notchAndCornersAnimation: animation,
      splashSpeedInMilliseconds: 300,
      notchSmoothness: NotchSmoothness.defaultEdge,
      gapLocation: GapLocation.center,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (val) {
        setState(() {
          _bottomNavIndex = val;
        });
        _pageController.animateToPage(
          val,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
