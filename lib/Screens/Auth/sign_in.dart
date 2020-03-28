import 'package:aha_app/Services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
            onPressed: () => _signInAnonymously(context),
            color: Colors.blue,
            minWidth: 150,
            child: Text('Sign In')),
      ),
    );
  }

  /*BackEnd*/
  Future _signInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<FirebaseAuthenticationService>(context,listen: false);
      final user = await auth.signInAnonymously();
      print('uid:${user.uid}');
    } catch (e) {
      print(e);
    }
  }
}
