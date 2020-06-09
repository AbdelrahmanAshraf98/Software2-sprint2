import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacyapp/Constants.dart';
import 'package:pharmacyapp/userhome.dart';
import 'package:pharmacyapp/welcome.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'DatabaseConnection.dart';
import 'pharmacy_home.dart';
import 'userclass.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final _auth = FirebaseAuth.instance;
  GlobalKey<FormState> _key = new GlobalKey();
  String email, password, username, type , phone, age , address;
  DataBaseConnection db = new DataBaseConnection();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
            children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(12.0, 100.0, 0.0, 0.0),
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                  color: P_color,
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                255.0, 110.0, 0.0, 0.0),
                            child: Text(
                              '.',
                              style: TextStyle(
                                  fontSize: 80.0,
                                  fontWeight: FontWeight.bold,
                                  color: S_color),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                            top: 25.0, left: 20.0, right: 20.0),
                        child: Column(children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    letterSpacing: 2.0),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: P_color))),
                          ),
                          SizedBox(height: 22.0),
                          TextField(
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                                labelText: 'E-mail',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    letterSpacing: 2.0),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: P_color))),
                          ),
                          SizedBox(height: 22.0),
                          TextField(
                            onChanged: (value) {
                              phone = value;
                            },
                            decoration: InputDecoration(
                                labelText: 'phone',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    letterSpacing: 2.0),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: P_color))),

                          ),
                          SizedBox(height: 22.0),
                          TextField(
                            onChanged: (value) {
                              age= value;
                            },
                            decoration: InputDecoration(
                                labelText: 'Age',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    letterSpacing: 2.0),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: P_color))),

                          ),
                          SizedBox(height: 22.0),
                          TextField(
                            onChanged: (value) {
                              address = value;
                            },
                            decoration: InputDecoration(
                                labelText: 'address',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    letterSpacing: 2.0),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: P_color))),

                          ),
                          SizedBox(height: 22.0),
                          TextField(
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    letterSpacing: 2.0),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: P_color))),
                            obscureText: true,
                          ),
                          SizedBox(height: 22.0),
                          TextField(
                            onChanged: (value) {
                              type = value;
                            },
                            decoration: InputDecoration(
                                labelText: 'sign up as',
                                hintText: 'type user or pharmacy',
                                labelStyle: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    letterSpacing: 2.0),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: P_color))),
                            obscureText: true,
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              shadowColor: P_color,
                              color: P_color,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () async {

                                    try {
                                      if (_key.currentState.validate()) {
                                        _key.currentState.save();
                                      final newuser =
                                      await _auth
                                          .createUserWithEmailAndPassword(
                                          email: email, password: password);

                                    //  if (newuser != null) {
                                        //TODO::nadef el data l tabel el user email w password w type
                                      //  FirebaseUser user = newuser.user;
                                      //  await Firestore.instance.collection('Users').document(user.uid).setData({ 'username': username , 'email': email , 'phone': phone, 'age':age, 'type': type });


                                        db.addUser(Users(
                                          userName: username,
                                          userEmail: email,
                                          userPassword: password,
                                          userAge: age,
                                          userAddress: address,
                                          userPhone: phone,
                                          userType: type.toLowerCase(),
                                        ));


                                        if (type.toLowerCase() == 'user') {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                                  return UserHome();
                                                }),
                                          );
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                                  return PharmacyHome();
                                                }),
                                          );
                                        }
                                        }

                                    } catch (e) {
                                      Alert(
                                        context: context,
                                        title: 'invalid input',
                                        desc: e,
                                      ).show();
                                    }

                                },
                                child: Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: L_color,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            height: 40.0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: P_color,
                                    style: BorderStyle.solid,
                                    width: 1.0),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return WelcomePage();
                                          }),
                                        );
                                      },
                                      child: Text(
                                        'Back',
                                        style: TextStyle(
                                            color: P_color,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration
                                                .underline),
                                      )),
                                ],
                              ),
                            ),
                          )
                        ]))
                  ]),
              SizedBox(
                height: 150,
              ),
            ]


        ));
  }
}

