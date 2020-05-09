import 'package:aha_app/Screens/homepage.dart';
import 'package:aha_app/Screens/morning_devo.dart';
import 'package:aha_app/Services/Api/sample_call.dart';
import 'package:aha_app/Services/Routing/routes.dart';
import 'package:flutter/material.dart';
// import 'package:aha_app/homepage.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));

  FluroRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      onGenerateRoute: FluroRouter.router.generator,
      home: Homepage(),
    );
  }
}
