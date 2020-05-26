import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants.dart';

class UserHome extends StatelessWidget {
  String Username = 'Abdelrahman Ashraf';
  int Userage = 22;
  String Usernum = '01033179558';
  String Userad = 'elwaili-abbasia-cairo';
  String text ;
  final TextController = TextEditingController() ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: P_color,
        title: Text(Username),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.userAlt),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 20.0, bottom: 5, top: 0),
              child: TextField(
                controller: TextController,
                style: TextStyle(
                  fontSize: 18,
                  color: P_color,
                ),
                onChanged:(value){
                   text = value;
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.search,
                        color: P_color,
                      ),
                      onPressed: (){
                        print(text);
                        TextController.clear();
                      },
                    ),
                    hintText: 'Enter a pharamacy or a drug name',
                    hintStyle: TextStyle(
                      color: L_color,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: S_color),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: P_color),
                    )),
              ),
            ),
            Card(
              color: P_color,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                        radius: 60,
                        child: Image(
                          image: AssetImage('images/logo.png'),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(Username, style: kbuttonStyle),
                          Row(
                            children: <Widget>[
                              Text('$Userage y', style: klabelStyle),
                              SizedBox(
                                width: 20,
                              ),
                              Text(Usernum, style: klabelStyle),
                            ],
                          ),
                          Text(Userad, style: klabelStyle),
                          Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              'edit profile >>',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: P_color,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            title: Text('home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.shoppingCart),
            title: Text('cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.moneyBillAlt),
            title: Text('order'),
          ),
        ],
      ),
    );
  }
}
