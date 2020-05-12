import 'package:aha_app/Screens/homepage.dart';
import 'package:aha_app/Screens/morning_devo.dart';
import 'package:aha_app/Services/Api/sample_call.dart';
import 'package:aha_app/Services/Routing/routes.dart';
import 'package:flutter/material.dart';
// import 'package:aha_app/homepage.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));

  FluroRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        //_showItemDialog(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        //_navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      //  _navigateToItemDetail(message);
      },
    );
    
  }

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
