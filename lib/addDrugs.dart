import 'package:flutter/material.dart';
import 'package:pharmacyapp/DatabaseConnection.dart';
import 'drugClass.dart';

class AddDrugs extends StatelessWidget {
  static String id = "AddDrugs";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('add drugs'),
        ),
        body: AddDrugsForm(),
      ),
    );
  }
}

class AddDrugsForm extends StatefulWidget{
  @override
  _AddDrugsFormState createState() => _AddDrugsFormState();
}
class _AddDrugsFormState extends State<AddDrugsForm>{
  GlobalKey<FormState> _key = new GlobalKey();  //instances of the class Drug
  String _drugName, _drugCode ,_drugPrice ,_drugQuantity;
  DataBaseConnection db = DataBaseConnection();

  @override
  Widget build(BuildContext context){
    final halfMediaWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _key,
      child: Column(
        children: <Widget>[

          Container(
            alignment: Alignment.topCenter,
            width: halfMediaWidth,
            child: TextFormField(
                decoration: InputDecoration(labelText: 'medicine name'),
                onSaved: (val){
                  _drugName = val;
                }

            ),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'medicine code'),

            onSaved: (val){
              _drugCode = val;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'medicine price'),
            onSaved: (val){
              _drugPrice = val;
            },
          ),

          TextFormField(
            decoration: InputDecoration(labelText: 'medicine quantity'),
            onSaved: (val){
              _drugQuantity = val ;
            },
          ),
          RaisedButton(
            color: Colors.blueGrey,
            child: Text(
              'add',
              style:TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed:(){
              if(_key.currentState.validate()){
                _key.currentState.save();
                db.addDrugs(Drugs(
                  drugName : _drugName,
                  drugCode : _drugCode,
                  drugPrice: _drugPrice,
                  drugQuantity: _drugQuantity,

                ));

              }
            },
          ),
        ],
      ),

    );
  }

}
