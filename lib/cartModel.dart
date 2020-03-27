import 'package:flutter/foundation.dart';

class CartModel with ChangeNotifier{
  int value = 0;
  void increment(){
    value++;
    notifyListeners();
  }
}