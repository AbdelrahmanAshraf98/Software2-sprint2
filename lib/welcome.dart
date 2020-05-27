import 'dart:math';

import 'package:flutter/material.dart';
import 'Constants.dart';
import 'signup.dart';
import 'login.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: P_color,
      body: SafeArea(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/logo2.png'),
            ),
            Text(
            'Egypt Pharmacies',
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.w700,
              color: L_color,
              ),
            ),
            Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print('Sign up');
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return SignUpPage();
                  }),);
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                      child: Text(
                        'Getting Started',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: P_color
                        ),
                      ),
                    ),
                    color: S_color,
                    margin: EdgeInsets.only(top: 10.0),
                    width: double.infinity,
                      height: 60

                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Have an account ?',
                   style: klabelStyle,
                  ),
                  GestureDetector(
                      onTap: () {
                        print('login');
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Login();
                        }),);
                      },
                      child: Text('Login',style: kbuttonStyle),
                  ),
                ],
              ),

            ],
          ),
        ],
      )),
    );
  }
}
