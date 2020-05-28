import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacyapp/DrugsList.dart';
import 'package:pharmacyapp/addDrugs.dart';
import 'Constants.dart';

class PharmacyHome extends StatelessWidget {
  String pharname = 'El Ezaby Pharmacy';
  String phar_rating = '3.5/5';
  String pharnum = '19555';
  String pharad = '235 st ramsis,cairo';
  String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              print('signed out');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            bottom: 15.0, top: 0, right: 15.0, left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Welcome $pharname...',style: klabelStyle.copyWith(color: P_color)),
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
                                  style: klabelStyle.copyWith(color: P_color)),
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
                                  style: klabelStyle.copyWith(color: P_color)),
                            ],
                          ),
                          Text(pharad,
                              style: klabelStyle.copyWith(color: P_color)),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              'edit profile >>',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
                            child: GestureDetector(
                              onDoubleTap: () => AddDrugs(),
                              child: Icon(
                                FontAwesomeIcons.plus,
                                size: 40,
                                color: P_color,
                              ),
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
                            child: GestureDetector(
                              onDoubleTap: () => DrugList() ,
                              child: Icon(
                                FontAwesomeIcons.edit,
                                size: 40,
                                color: P_color,
                              ),
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
