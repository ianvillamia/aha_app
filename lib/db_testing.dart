import 'package:aha_app/Services/Local/db.dart';
import 'package:flutter/material.dart';

class DbTest extends StatelessWidget {
  const DbTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () async {
                //insert command
              },
              child: Text('insert'),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('query'),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('update'),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('delete'),
            ),
          ],
        ),
      ),
    );
  }
}
