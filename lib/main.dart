import 'package:flutter/material.dart';
import 'welcome.dart';
void main() => runApp(Main());

class Main extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue[300],
        scaffoldBackgroundColor: Colors.red[20],
      ),
      home: WelcomePage(),
    );
  }
}
