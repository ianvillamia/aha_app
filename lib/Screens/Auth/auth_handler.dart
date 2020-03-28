import 'package:aha_app/Screens/Auth/sign_in.dart';
import 'package:aha_app/Screens/home.dart';
import 'package:aha_app/Services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthHandler extends StatelessWidget {
  const AuthHandler({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService =
        Provider.of<FirebaseAuthenticationService>(context, listen: false);

    return StreamBuilder(
      stream: authService.onAuthChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          return user != null ? HomePage() : SignIn();
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
