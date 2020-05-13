import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
class NavigationProvider with ChangeNotifier{
   int selected =0;
  void updateBottomNavigation({@required int val,@required BuildContext context}){
    selected=val;
    if(val==0){
      Navigator.pushNamed(context, '/home');
    }
    if(val==1){
    Navigator.pushNamed(context, '/morningDevo');
    }
    if(val==2){
       Navigator.pushNamed(context, '/eveningDevo');
    }
    notifyListeners();
  }
  void updateWithoutNavigation({@required val}){
    selected=val;
    notifyListeners();
  }

}