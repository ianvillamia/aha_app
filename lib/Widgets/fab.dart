import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:aha_app/Providers/navigationProvider.dart';
class FloatingButton extends StatelessWidget {
  const FloatingButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: (){
         final _navigatorProvider = Provider.of<NavigationProvider>(context,listen: false);
    _navigatorProvider.selected=3;
          Navigator.pushNamed(context, '/noteBody');},
        child: Icon(FlutterIcons.pencil_alt_faw5s),
        backgroundColor: Colors.blueAccent,
      );
  }
}