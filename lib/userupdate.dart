import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'userclass.dart';
import 'package:pharmacyapp/DatabaseConnection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'userhome.dart';
class UserUpdate extends StatefulWidget {
  @override
  _UserUpdateState createState() => _UserUpdateState();
}

class _UserUpdateState extends State<UserUpdate> {
  Users user = new Users();
  DocumentSnapshot _documentSnapshot;
/**
  String name = ,
      num = null,
      location = null,
      password = null;
**/

  String name,num, location , password;
  bool eye = true, first = false, second = false, third = false,forth = false;
  int age = 22;
   
  TextEditingController _usernameController = TextEditingController(text: 'salmakhaled' );
  TextEditingController _addressController = TextEditingController(text :'giza');
  TextEditingController _phoneController = TextEditingController(text: '0203240048034');
  TextEditingController _passwordController = TextEditingController();
   DocumentSnapshot _currentDocument;

  List<DocumentSnapshot> document ;

  //UserUpdate({this.documents});

  GlobalKey _key = new GlobalKey() ;
  _updateUsername() async{
    Firestore db = new Firestore();
    //_currentdocument.documentID
    await db.collection('Users')
        .document('u2KvQgG5KZUNDjdo8YY6')
        .updateData({'username' : _usernameController.text});
  }
  _updateAddress() async{
    Firestore db = new Firestore();
    await db.collection('Users')
        .document('u2KvQgG5KZUNDjdo8YY6')
        .updateData({'address' : _addressController.text});
  }
  _updatePassword() async{
    Firestore db = new Firestore();
    await db.collection('Users')
        .document('u2KvQgG5KZUNDjdo8YY6')
        .updateData({'password' : _passwordController.text});
  }
  _updatePhone() async{
    Firestore db = new Firestore();
    await db.collection('Users')
        .document('u2KvQgG5KZUNDjdo8YY6')
        .updateData({'phone' : _phoneController.text});
  }


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
    _usernameController.addListener(_updateUsername);
    _addressController.addListener(_updateAddress);
    _phoneController.addListener(_updatePhone);
    _passwordController.addListener(_updatePassword);

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
          key: _key,
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
                    child: TextFormField(
                      decoration: InputDecoration(
                       //   hintText: _currentDocument.data['username'],
                          hintStyle: klabelStyle.copyWith(color: L_color),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: P_color))),
//                obscureText: true,
                    // initialValue:,
                      controller: _usernameController,
                      enabled: first,

                      onChanged: (value) {
                        user.userName = value;
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
                        _updateUsername();


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
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                       //     hintText: _currentDocument.data['phone'],
                            hintStyle: klabelStyle.copyWith(color: L_color),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: P_color))),
//                obscureText: true,
                        enabled: second,
                        onChanged: (value) {
                          user.userPhone = value;
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
                        _updatePhone();
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
                      child: TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                       //     hintText: _currentDocument.data['address'],
                            hintStyle: klabelStyle.copyWith(color: L_color),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: P_color))),
//                obscureText: true,
                        enabled: third,
                        onChanged: (value) {
                          user.userAddress = value;
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
                        _updateAddress();
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
                      child: TextFormField(
                        controller: _passwordController,
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
                          user.userPassword = value;
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
                        _updatePassword();
                      },
                    ),
                  ],),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                  //  Navigator.pop(context);
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserHome()),

                    );
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
