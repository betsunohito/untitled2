import 'package:flutter/material.dart';
import 'package:untitled2/screens/components/cart_body.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CartScreen();
  }
}

class _CartScreen extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context),body: CartBody(),);
  }

 AppBar buildAppBar(BuildContext context) {
    return AppBar(
title: Column(
  children: [
    const Text("Your Cart",
    style: TextStyle(color: Colors.black)),
    Text("5 items",style: Theme.of(context).textTheme.caption,)
  ],
),

    );

 }
}