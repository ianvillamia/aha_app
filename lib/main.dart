import 'package:aha_app/Screens/Auth/auth_handler.dart';
import 'package:aha_app/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<FirebaseAuthentication>(
      create: (_) => FirebaseAuthentication(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthHandler(),
      ),
    );
  }
}
