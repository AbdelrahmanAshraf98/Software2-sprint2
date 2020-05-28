import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacyapp/DatabaseConnection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacyapp/Constants.dart';

import 'DrugsList.dart';


class UpdateDrugsForm extends StatefulWidget{
  DocumentSnapshot document;
  UpdateDrugsForm(this.document);
  @override
  _UpdateDrugsFormState createState() => _UpdateDrugsFormState();
}
class _UpdateDrugsFormState extends State<UpdateDrugsForm>{
  GlobalKey<FormState> _key = new GlobalKey();  //instances of the class Drug
  String _drugName, _drugCode, _drugPrice, _drugQuantity, _drugLocation;
  DataBaseConnection db = DataBaseConnection();

  @override
  Widget build(BuildContext context){
    final halfMediaWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
      backgroundColor: P_color,
      elevation: 0,

      leading: IconButton(icon: Icon(FontAwesomeIcons.arrowLeft), onPressed: () {Navigator.push(context,
        MaterialPageRoute(builder: (context) => ListViewDrug()),
      );}),

    ),
    body:Form(
      key: _key,
      child: Column(
        children: <Widget>[

          Container(
            alignment: Alignment.topCenter,
            width: halfMediaWidth,
            child: TextFormField(
                decoration: InputDecoration(labelText: 'medicine name'),
                onSaved: (val)=> _drugName = val,
                  initialValue:widget.document.data['name'],



            ),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'medicine code'),
            onSaved: (val)=> _drugCode = val,
              initialValue:widget.document.data['code']
            ,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'medicine price'),
            onSaved: (val)=> _drugPrice = val,
              initialValue:widget.document.data['price'],

          ),

          TextFormField(
            decoration: InputDecoration(labelText: 'medicine quantity'),
            onSaved: (val)=> _drugQuantity = val,
              initialValue:widget.document.data['quantity'],

          ),
          SizedBox(
            height: 20,
          ),

          RaisedButton(
            color: P_color,
            child: Text(
              'Update',
              style:TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed:(){
              if(_key.currentState.validate()){
                _key.currentState.save();
                db.updateDrugs({
                  'name' : _drugName,
                  'code' : _drugCode,
                  'price': _drugPrice,
                  'quantity': _drugQuantity}
                  ,widget.document.documentID
                );

              }
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListViewDrug()),
              );
            },
          ),
        ],
      ),

    ),
    ),
    );
  }

}
