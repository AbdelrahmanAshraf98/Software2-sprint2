import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacyapp/DrugsList.dart';
import 'package:pharmacyapp/addDrugs.dart';
import 'Constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login.dart';

class PharmacyHome extends StatefulWidget {
  String email;
  PharmacyHome({this.email});
  @override
  _PharmacyHomeState createState() => _PharmacyHomeState(email: email);
}

class _PharmacyHomeState extends State<PharmacyHome> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  String email;
  _PharmacyHomeState({this.email});
  String pharname = 'El Ezaby Pharmacy';
  String phar_rating = '3.5/5';
  String pharnum = '19555';
  String pharad = '235 st ramsis,cairo';
  String text;

  @override
  void initState() {
    // TODO: implement initState
    print('tmaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaam');
  }

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure ?'),
            content: Text('You are going to exit the application'),
            actions: <Widget>[
              FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  }),
              FlatButton(
                  child: Text('yes'),
                  onPressed: () {
                    SystemNavigator.pop();
                  }),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: S_color,
        title: Text(pharname),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.bell),
            onPressed: () {
              print('profile');
            },
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.signOutAlt),
            onPressed: () {
              _auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Login();
                }),
              );
              print('signed out');
            },
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: 15.0, top: 0, right: 15.0, left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(email, style: klabelStyle.copyWith(color: P_color)),
              Container(
                child: Card(
                  color: S_color,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                            radius: 60,
                            child: Image(
                              image: AssetImage('images/logo.png'),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: <Widget>[
                            Text(pharname, style: kbuttonStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(phar_rating,
                                    style:
                                        klabelStyle.copyWith(color: P_color)),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  FontAwesomeIcons.starHalfAlt,
                                  size: 20,
                                  color: P_color,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(pharnum,
                                    style:
                                        klabelStyle.copyWith(color: P_color)),
                              ],
                            ),
                            Text(pharad,
                                style: klabelStyle.copyWith(color: P_color)),
                            Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Text(
                                'edit profile >>',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            Card(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return AddDrugs();
                            }),
                          );
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              color: P_color,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  size: 40,
                                  color: P_color,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Add drugs',
                                style: klabelStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return DrugList();
                            }),
                          );
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              color: P_color,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  FontAwesomeIcons.edit,
                                  size: 40,
                                  color: P_color,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Show/Edit drugs',
                                style: klabelStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            color: P_color,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.white,
                              child: Icon(
                                FontAwesomeIcons.moneyBillAlt,
                                size: 40,
                                color: P_color,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Show Bills',
                              style: klabelStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: P_color,
        backgroundColor: S_color,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            title: Text('home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userAlt),
            title: Text('edit profile'),
          ),
        ],
      ),
    );
  }
}
