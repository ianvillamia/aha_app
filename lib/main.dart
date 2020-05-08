
import 'package:flutter/material.dart';
// import 'package:aha_app/homepage.dart';
import 'package:aha_app/routes.dart';

void main() {
  FluroRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      onGenerateRoute: FluroRouter.router.generator,
      // home: Login(),
    );
  }
}
