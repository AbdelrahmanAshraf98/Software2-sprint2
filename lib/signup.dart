import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      debugShowCheckedModeBanner: false,
//        routes: <String, WidgetBuilder>{
//          '/main': (context) => MyHomePage(),
//        }
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage>{

  @override
  Widget build(BuildContext context){
    return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
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
                          fontSize: 80.0, fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(255.0, 110.0, 0.0, 0.0),
                    child: Text(
                      '.',
                      style: TextStyle(
                          fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.green
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              letterSpacing: 2.0
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                          )
                      ),
                    ),
                    SizedBox(height: 22.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              letterSpacing: 2.0
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                          )
                      ),
                    ),
                    SizedBox(height: 22.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              letterSpacing: 2.0
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                          )
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 22.0),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Confirm Your Password',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              letterSpacing: 2.0
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                          )
                      ),
                      obscureText: true,
                    ),

                    SizedBox(height: 40.0),
                    Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: (){
                            //Going to Home Page After Sign up
                          },
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'
                              ),
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
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 1.0
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        //Going To Singup Page Button
                        Navigator.pushNamed(context,'/main');
                      },
                    child: Text(
                      'Back',
                      style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline
                  ),
                )
              )
            ],
          ),
          ),
            )
        ]
      )
        )
      ]
    )
    );
  }
}
