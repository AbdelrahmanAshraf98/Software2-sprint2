import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
import 'drugClass.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  final _formKey = GlobalKey<FormState>();
  //instances of the class Drugs
  Drugs drug = Drugs();
  @override
  Widget build(BuildContext context){
    final halfMediaWidth = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            width: halfMediaWidth,
            child: MyTextFormField(
              hintText: 'Medicine name',
              validator: (String value){
                if(value.isEmpty){
                  return 'Enter the medicine name ';
                }
                return null;
              },
            ),
          ),
          MyTextFormField(
            hintText: 'Medicine Code',
            validator: (String value){
              if(value.isEmpty){
                return 'Enter the medicine code ';
              }
              return null;
            },
          ),
          MyTextFormField(
            hintText: 'Medicine price',
            validator: (String value){
              if(value.isEmpty){
                return 'Enter the medicine price' ;
              }
              return null;
            },
          ),

          MyTextFormField(
            hintText: 'Medicine quantity',
            validator: (String value){
              if(value.isEmpty){
                return 'Enter the medicine quantity ';
              }
              return null;
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
            onPressed: (){
              if(_formKey.currentState.validate()){
                //all the fields values are saved
                _formKey.currentState.save();
                //to navigate to another route
                /**
                 * Navigator.push(context,MaterialPageRoute(builder:(context)=>secondRoute()));
                 *
                 * **/
              }
            },
          ),
        ],
      ),

    );
  }
}
class MyTextFormField extends StatelessWidget{
  final String hintText;
  final Function validator;
  final Function onSaved;

  MyTextFormField({this.hintText,this.validator,this.onSaved});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        onSaved: onSaved,
        validator: validator,
      ),
    );
  }
}