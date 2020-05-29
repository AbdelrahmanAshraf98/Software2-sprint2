import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserUpdate extends StatefulWidget {
  @override
  _UserUpdateState createState() => _UserUpdateState();
}

class _UserUpdateState extends State<UserUpdate> {
  String name = 'abdelrahman',
      num = '01033179558',
      location = 'elwaili-abbasia-cairo',
      password = '982018';
  bool eye = true, first = false, second = false, third = false,forth = false;
  int age = 22;

  List<DropdownMenuItem<String>> d = [];
  DropdownButton<String> androidDropDown() {
    for (int i = 15; i <= 100; i++) {
      String c = i.toString();
      var e = DropdownMenuItem(
        child: Text(c),
        value: c,
      );
      d.add(e);
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    androidDropDown();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: P_color,
        title: Text('Edit info'),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.check),
            onPressed: () {
              Navigator.pop(context);
              print('edited');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 100,
                  child: Center(
                      child: Text(
                    'Fill the fields you want to\nchange then press APPly\nor Checkmark on the top right',
                    style: klabelStyle.copyWith(color: P_color),
                    textAlign: TextAlign.center,
                  )),
                  decoration: BoxDecoration(
                    color: L_color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Name :',
                  style: klabelStyle.copyWith(color: P_color),
                ),
                Row(
                  children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: name,
                          hintStyle: klabelStyle.copyWith(color: L_color),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: P_color))),
//                obscureText: true,
                      enabled: first,
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.pencilAlt),
                    color: P_color,
                    onPressed: () {
                      setState(() {
                        if (first == true)
                          first = false;
                        else
                          first = true;
                      });
                    },
                  ),
                ],),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Age :',
                  style: klabelStyle.copyWith(color: P_color),
                ),
                DropdownButton<String>(
                  value: age.toString(),
                  style: TextStyle(color: P_color),
                  items: d,
                  onChanged: (value) {
                    setState(() {
                      age = int.parse(value);
                    });
                    print(value);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Phone number :',
                  style: klabelStyle.copyWith(color: P_color),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText:num,
                            hintStyle: klabelStyle.copyWith(color: L_color),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: P_color))),
//                obscureText: true,
                        enabled: second,
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.pencilAlt),
                      color: P_color,
                      onPressed: () {
                        setState(() {
                          if (second == true)
                            second = false;
                          else
                            second = true;
                        });
                      },
                    ),
                  ],),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Address :',
                  style: klabelStyle.copyWith(color: P_color),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: location,
                            hintStyle: klabelStyle.copyWith(color: L_color),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: P_color))),
//                obscureText: true,
                        enabled: third,
                        onChanged: (value) {
                          location = value;
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.pencilAlt),
                      color: P_color,
                      onPressed: () {
                        print('hi');
                        setState(() {
                          if (third == true)
                            third = false;
                          else
                            third = true;
                        });
                      },
                    ),
                  ],),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Password :',
                  style: klabelStyle.copyWith(color: P_color),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        enabled: forth,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.eye,
                                color: P_color,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (eye == true)
                                    eye = false;
                                  else
                                    eye = true;
                                });
                              },
                            ),
                            hintText: 'Enter your password',
                            hintStyle: klabelStyle.copyWith(color: L_color),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: P_color))),
                        obscureText: eye,
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.pencilAlt),
                      color: P_color,
                      onPressed: () {
                        setState(() {
                          if (forth == true)
                            forth = false;
                          else
                            forth = true;
                        });
                      },
                    ),
                  ],),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    print('edited');
                  },
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        color: P_color,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                          child: Text(
                        'Apply',
                        style: klabelStyle,
                      )),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
