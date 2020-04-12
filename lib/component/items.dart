import 'package:flutter/material.dart';
import 'package:pharmacyapp/listcart.dart';

class MyItem extends StatefulWidget {
  final String itemName;
  final int itemPrice;

  MyItem({this.itemName, this.itemPrice});

  @override
  _MyItemState createState() =>
      _MyItemState(itemName: itemName, itemPrice: itemPrice);
}

class _MyItemState extends State<MyItem> {
  final String itemName;
  final int itemPrice;

  _MyItemState({this.itemName, this.itemPrice});

  int _counter = 0;

  _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 20,
            borderRadius: BorderRadius.circular(24.0),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$itemName',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'price:$itemPrice LE',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: FloatingActionButton(
                              backgroundColor: Colors.red,
                              child: Icon(Icons.remove),
                              onPressed: _decrementCounter,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              '$_counter',
                              style: TextStyle(fontSize: 25),
                            ),
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: FloatingActionButton(
                              child: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  CartBrain().AddCart(MyItem());
                                });
                                _incrementCounter();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  width: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.contain,
                      alignment: Alignment.topRight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
