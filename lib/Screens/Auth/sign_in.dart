import 'package:aha_app/Services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
   Center(
        child: MaterialButton(
            onPressed: () {},
            color: Colors.blue,
            minWidth: 150,
            child: Text('Sign In')),
      );
    
  }

  /*BackEnd*/
  Future _signInAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<FirebaseAuthentication>(context);
      final user = await auth.signInAnonymously();
      print('uid:${user.uid}');
    } catch (e) {
      print(e);
    }
  }


}
