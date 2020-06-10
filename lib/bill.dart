import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacyapp/DatabaseConnection.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacyapp/Constants.dart';

DataBaseConnection db = new DataBaseConnection();

class ShowBill extends StatefulWidget {
  @override
  _ShowBillState createState() => new _ShowBillState();
}

class _ShowBillState extends State<ShowBill> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Bill',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Your Order'),
          centerTitle: true,
          backgroundColor: P_color,
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection("Cart").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return Bill(documents: snapshot.data.documents);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null, // push to payment rules
          child: Icon(FontAwesomeIcons.check),
          backgroundColor: P_color,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

class Bill extends StatelessWidget {
  final List<DocumentSnapshot> documents;
  double total = 0;

  Bill({this.documents});
  Widget build(BuildContext context) {
    for (int i = 0; i < documents.length; i++) {
      total += documents[i].data['counter'] * documents[i].data['price'];
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: documents.length,
                padding: EdgeInsets.only(top: 12.0),
                itemBuilder: (context, position) {
                  return Column(
                    children: <Widget>[
                      Divider(
                        height: 6.0,
                      ),
                      Card(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  ' ${documents[position].data['name']}',
                                  style: TextStyle(
                                    color: P_color,
                                    fontSize: 24.0,
                                  ),
                                ),
                                subtitle: Text(
                                  'Code : ${documents[position].data['code']}  ' +
                                      "\n"
                                          'Price : ${documents[position].data['price']}' +
                                      "\n"
                                          'count: ${documents[position].data['counter']}',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 15.0,
                                  ),
                                ),
                                leading: Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 25.0,
                                        child: Image(
                                          image: AssetImage(
                                              '${documents[position].data['location']}'),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  db.deleteFromCart(
                                      documents[position].documentID);
                                }),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Expanded(
            child: Card(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'ToTal Cost',
                        style: TextStyle(
                          color: P_color,
                          fontSize: 24.0,
                        ),
                      ),
                      subtitle: Text(
                        'total : $total',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
