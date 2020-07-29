import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class NavigationProvider with ChangeNotifier {
  PageController pageController = PageController();

  var bottomNavIndex = 0;
  void changePage(int val) {
    bottomNavIndex = val;
    pageController.animateToPage(
      val,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }
}
