//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:pharmacyapp/component/items.dart';
//import 'package:pharmacyapp/search_screen.dart';
//import 'package:pharmacyapp/cart.dart';
//import 'package:pharmacyapp/listcart.dart';
//
//class Customer extends StatefulWidget {
//  @override
//  _CustomerState createState() => _CustomerState();
//}
//
//class _CustomerState extends State<Customer> {
//  int _counter = 0;
//
//  _incrementCounter() {
//    setState(() {
//      _counter++;
//    });
//  }
//
//  _decrementCounter() {
//    setState(() {
//      _counter--;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        elevation: 0.1,
//        title: Text('pharmacy'),
//        actions: <Widget>[
//          IconButton(
//              icon: Icon(
//                Icons.search,
//                color: Colors.white,
//              ),
//              onPressed: () {
//                print('search icon is working');
//                Navigator.of(context).push(
//                    MaterialPageRoute(builder: (context) => SearchScreen()));
//              }),
//          IconButton(
//              icon: Icon(
//                Icons.shopping_cart,
//                color: Colors.white,
//              ),
//              onPressed: () {
//                Navigator.push(context, MaterialPageRoute(builder: (context) {
//                  return MyCart();
//                }),);
//              })
//        ],
//      ),
//      drawer: Drawer(
//        child: ListView(
//          children: <Widget>[
////            header
//            UserAccountsDrawerHeader(
//                accountName: Text('mohamed zaki'),
//                accountEmail: Text('mz9773883@gmail.com'),
//                currentAccountPicture: Image.asset('assets/images/logo.png')),
////            body
//            ListTile(
//              title: Text('Home Page'),
//              leading: Icon(Icons.home),
//              onTap: () {
//                print(' test home page');
//              },
//            ),
//
//            ListTile(title: Text('My account'), leading: Icon(Icons.person)),
//
//            ListTile(
//                title: Text('My Orders'), leading: Icon(Icons.shopping_basket)),
//
//            ListTile(title: Text('Categoris'), leading: Icon(Icons.dashboard)),
//
//            ListTile(title: Text('Favourites'), leading: Icon(Icons.favorite)),
//
//            Divider(),
//
//            ListTile(
//                title: Text('Settings'),
//                leading: Icon(Icons.settings, color: Colors.blue)),
//
//            ListTile(
//              title: Text('About'),
//              leading: Icon(Icons.help, color: Colors.green),
//            ),
//          ],
//        ),
//      ),
//      body: ListView(
//        children: <Widget>[
//          MyItem(itemName: "mohamed", itemPrice: 50,),
//          MyItem(),
//          MyItem(),
//          MyItem(),
//          MyItem(),
//          MyItem(),
//          MyItem(),
//          MyItem(),
//          MyItem(),
//          MyItem(),
//          MyItem(),
//        ],
//      ),
//    );
//  }
//}
