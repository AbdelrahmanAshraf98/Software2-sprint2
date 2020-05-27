import 'package:pharmacyapp/drugClass.dart';
import 'package:pharmacyapp/DatabaseConnection.dart';
import 'package:flutter/material.dart';

class EditDrugs extends StatelessWidget {
  static String id = 'EditDrugs';
  String _name, _code, _price, _quantity, _location;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _db = DataBaseConnection();
  @override
  Widget build(BuildContext context) {
    Drugs drug = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'medicine name'),
                  onSaved: (val){
                    _name = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'medicine code'),
                  onSaved: (val){
                    _code = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'medicine price'),
                  onSaved: (val){
                    _price = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'medicine quantity'),
                  onSaved: (val){
                    _quantity = val;
                  },
                ),

                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'medicine location'),
                  onSaved: (val){
                    _location = val;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();

                      _db.editDrugs({
                        'name': _name,
                        'code': _code,
                        'price': _price,
                        'quantity': _quantity,
                        'location': _location,

                      }, drug.drugCode);
                    }
                  },
                  child: Text('Edit drug'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}