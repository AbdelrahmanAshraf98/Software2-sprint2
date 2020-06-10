import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacyapp/pharmacyClass.dart';
import 'Constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class PharmacyUpdate extends StatefulWidget {
  @override
  _PharmacyUpdateState createState() => _PharmacyUpdateState();
}

class _PharmacyUpdateState extends State<PharmacyUpdate> {
  Pharmacy phar = Pharmacy();DocumentSnapshot _documentSnapshot;String name,num, location , password;
  bool eye = true, first = false, second = false, third = false,forth = false;
  int age = 22;
  TextEditingController _pharnameController = TextEditingController(text: 'ezabi' );
  TextEditingController _addressController = TextEditingController(text :'giza');
  TextEditingController _phoneController = TextEditingController(text: '1999');
  TextEditingController _passwordController = TextEditingController();
  DocumentSnapshot _currentDocument;
  List<DocumentSnapshot> document ;
  //UserUpdate({this.documents});
  GlobalKey _key = new GlobalKey() ;
  _updatePharname() async{
    Firestore db = new Firestore();
    await db.collection('Pharmacy').document(_currentDocument.documentID).updateData({'name' : _pharnameController.text});}
  _updateAddress() async{Firestore db = new Firestore();
    await db.collection('Pharmacy').document(_currentDocument.documentID).updateData({'address' : _addressController.text});}
  _updatePassword() async{Firestore db = new Firestore();
    await db.collection('Pharmacy').document(_currentDocument.documentID).updateData({'password' : _passwordController.text});}
  _updatePhone() async{Firestore db = new Firestore();
    await db.collection('Pharmacy').document(_currentDocument.documentID).updateData({'phone' : _phoneController.text});}
    List<DropdownMenuItem<String>> d = [];
  DropdownButton<String> androidDropDown() {
    for (int i = 15; i <= 100; i++) {
      String c = i.toString();
      var e = DropdownMenuItem(
        child: Text(c), value: c,);
      d.add(e);}}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    androidDropDown();
    _pharnameController.addListener(_updatePharname);_addressController.addListener(_updateAddress);
    _phoneController.addListener(_updatePhone);_passwordController.addListener(_updatePassword);}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: P_color, title: Text('Edit info'),
        actions: <Widget>[
          IconButton(icon: Icon(FontAwesomeIcons.check), onPressed: () {Navigator.pop(context);print('edited');},),],),
      body: Padding(padding: const EdgeInsets.all(20.0),
        child: ListView(key: _key,
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(height: 100,
                  child: Center(child: Text(
                        'Fill the fields you want to\nchange then press APPly\nor Checkmark on the top right', style: klabelStyle.copyWith(color: P_color), textAlign: TextAlign.center,)),
                  decoration: BoxDecoration(color: L_color, borderRadius: BorderRadius.circular(10),),),
                SizedBox(height: 30,),
                Text('Name :', style: klabelStyle.copyWith(color: P_color),),
                Row(children: <Widget>[Expanded(
                      child: TextFormField(decoration: InputDecoration(hintStyle: klabelStyle.copyWith(color: L_color), focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: P_color))),
                        controller: _pharnameController, enabled: first,
                        onChanged: (value) {phar.pharName = value;},),),
                    IconButton(icon: Icon(FontAwesomeIcons.pencilAlt), color: P_color, onPressed: () {
                      setState(() {if (first == true) first = false;else first = true;});_updatePharname();},),],),
                SizedBox(height: 10,),
                Text('Age :', style: klabelStyle.copyWith(color: P_color),),
                DropdownButton<String>(value: age.toString(), style: TextStyle(color: P_color), items: d,
                  onChanged: (value) {setState(() {age = int.parse(value);});
                    print(value);},),
                SizedBox(height: 10,),
                Text('Phone number :', style: klabelStyle.copyWith(color: P_color),),
                Row(children: <Widget>[
                    Expanded(child: TextFormField(controller: _phoneController, decoration: InputDecoration(hintStyle: klabelStyle.copyWith(color: L_color),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: P_color))), enabled: second,
                        onChanged: (value) {phar.pharNumber = value;},),),
                    IconButton(icon: Icon(FontAwesomeIcons.pencilAlt), color: P_color,
                      onPressed: () {setState(() {
                          if (second == true) second = false;
                          else second = true;});
                        _updatePhone();},),],),
                SizedBox(height: 10,),
                Text('Address :', style: klabelStyle.copyWith(color: P_color),),
                Row(children: <Widget>[
                    Expanded(child: TextFormField(controller: _addressController, decoration: InputDecoration(hintStyle: klabelStyle.copyWith(color: L_color),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: P_color))), enabled: third,
                        onChanged: (value) {phar.pharLocation = value;},),),
                    IconButton(icon: Icon(FontAwesomeIcons.pencilAlt), color: P_color, onPressed: () {print('hi');
                        setState(() {if (third == true) third = false;else third = true;});
                        _updateAddress();},),],),
                SizedBox(height: 10,),
                Text('Password :', style: klabelStyle.copyWith(color: P_color),),
                Row(children: <Widget>[
                    Expanded(child: TextFormField(controller: _passwordController, enabled: forth, decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(FontAwesomeIcons.eye, color: P_color,),
                              onPressed: () {setState(() {
                                  if (eye == true) eye = false;
                                  else eye = true;});},),
                            hintText: 'Enter your password', hintStyle: klabelStyle.copyWith(color: L_color),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: P_color))),
                        obscureText: eye,
                        onChanged: (value) {phar.pharPassword = value;},),),
                    IconButton(icon: Icon(FontAwesomeIcons.pencilAlt), color: P_color,
                      onPressed: () {setState(() {
                          if (forth == true) forth = false;else forth = true;});
                        _updatePassword();},),],),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {Navigator.pop(context);
                  print('edited');},
                  child: Center(
                    child: Container(margin: EdgeInsets.all(10), width: 250, height: 50, decoration: BoxDecoration(color: P_color, borderRadius: BorderRadius.circular(25),),
                      child: Center(child: Text('Apply', style: klabelStyle,)),),),)],),],),),);}}