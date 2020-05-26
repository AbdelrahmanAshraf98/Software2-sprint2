import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Constants.dart';

class UserHome extends StatelessWidget {
  String Username = 'Abdelrahman Ashraf';
  int Userage = 22;
  String Usernum = '01033179558';
  String Userad = 'elwaili-abbasia-cairo';
  String text;
  final TextController = TextEditingController();

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
                onChanged: (value) {
                  text = value;
                },
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.search,
                        color: P_color,
                      ),
                      onPressed: () {
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Top Pharmacies',
                style: TextStyle(
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w400,
                    color: P_color,
                    fontSize: 18,
                ),
              ),
            ),
            Container(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  pharmacy_card(),
                  pharmacy_card(),
                  pharmacy_card(),
                  pharmacy_card(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Best Selling',
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w400,
                  color: P_color,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  pharmacy_card2(),
                  pharmacy_card2(),
                  pharmacy_card2(),
                  pharmacy_card2(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: S_color,
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

class pharmacy_card extends StatelessWidget {
  const pharmacy_card({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
                radius: 40,
                child: Image(
                  image: AssetImage('images/logo.png'),
                )),
            SizedBox(
              height: 5,
            ),
            Text(
              'Elezaby 1',
              style: klabelStyle.copyWith(color: P_color),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.phoneAlt,
                  size: 15,
                ),
                Text(
                  '19955',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class pharmacy_card2 extends StatelessWidget {
  const pharmacy_card2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CircleAvatar(
                  radius: 30,
                  backgroundColor: S_color,
                  child: Image(
                    image: AssetImage('images/logo.png'),
                  )),
              SizedBox(
                height: 5,
              ),
              Column(
                children:<Widget>[
                  Text(
                  'ketoval 500',
                  style: klabelStyle.copyWith(color: P_color),
                ),
                  Text(
                    'El Ezaby',
                    style: klabelStyle.copyWith(color: P_color),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.phoneAlt,
                        size: 15,
                      ),
                      Text(
                        '19955',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ],
        ),
              Text('25 L.E/P',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)
            ],
          ),
        ),
      ),
    );
  }
}
