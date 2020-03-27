import 'package:aha_app/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: Colors.amber,
      child: MaterialButton(
          onPressed: () {
            cart.increment();
          },
          child: Text('ADD')),
    );
  }
}
