import 'package:aha_app/Providers/devotinalProvider.dart';
import 'package:aha_app/Providers/navigationProvider.dart';
import 'package:aha_app/Screens/aha_body.dart';
import 'package:aha_app/Screens/aha_message.dart';
import 'package:aha_app/Screens/body.dart';
import 'package:aha_app/Screens/homepage.dart';
import 'package:aha_app/Screens/morning_devo.dart';
import 'package:aha_app/Screens/notesList.dart';
import 'package:aha_app/Services/Api/sample_call.dart';
import 'package:aha_app/Services/Routing/routes.dart';
import 'package:aha_app/db_testing.dart';
import 'package:flutter/material.dart';
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
    return MultiProvider(
      providers: [
        ListenableProvider<NavigationProvider>(
            create: (_) => NavigationProvider()),
        ChangeNotifierProvider<DevotionProvider>(
          create: (_) => DevotionProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: FluroRouter.router.generator,
        home: Body(),
        // home: DbTest(),
        // home: AhaBody(),
        //home: NoteList(),
        //home: AhaMessage(),
      ),
    );
  }
}
