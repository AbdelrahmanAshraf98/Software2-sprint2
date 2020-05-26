import 'package:flutter/material.dart';
import 'package:pharmacyapp/listcart.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('mycart'),
          elevation: 0.1,
        ),
        body: ListView(
          children: <Widget>[
            CartBrain().CartList[CartBrain().lenCart()],
          ],
        ));
  }
}
