import 'package:flutter/material.dart';
import 'package:pharmacyapp/cart.dart';
import 'package:pharmacyapp/search_screen.dart';
//import 'DrugsList.dart';
import 'customer.dart';
import 'addDrugs.dart';
import 'userhome.dart';
void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue[300],
        scaffoldBackgroundColor: Colors.red[20],
      ),
      home: UserHome(),
    );
  }
}
