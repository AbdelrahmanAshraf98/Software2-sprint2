import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'pharmacy_home.dart';
import 'Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return PharmacyHome(email: loggedInUser.email);
          }),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: P_color,
          size: 100.0,
        ),
      ),
    );
  }
}
