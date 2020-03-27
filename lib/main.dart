import 'package:aha_app/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './cartModel.dart';
import './catalog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<CartModel>(
          create: (context) => CartModel(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Catalog(),
          SizedBox(
            height: 50,
          ),
          Cart()
        ],
      ),
    );
  }
}
