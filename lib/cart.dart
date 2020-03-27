import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartModel.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cart = Provider.of<CartModel>(context, listen: false);
    return Center(
        child: Consumer<CartModel>(
            builder: (context, _cart, child) => Text(_cart.value.toString())));
  }
}
