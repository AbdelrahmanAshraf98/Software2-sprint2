import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacyapp/addDrugs.dart';

import 'Constants.dart';
import 'DatabaseConnection.dart';
import 'editDrugs.dart';

DataBaseConnection db = DataBaseConnection();

class ListViewDrug extends StatefulWidget {
  @override
  _ListViewDrugState createState() => new _ListViewDrugState();
}

class _ListViewDrugState extends State<ListViewDrug> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharmacy App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Drug list'),
          centerTitle: true,
          backgroundColor: S_color,
          leading: IconButton(
              icon: Icon(FontAwesomeIcons.arrowLeft), onPressed: () {}),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _createNewDrug(context),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection("Drugs").snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            return DrugList(documents: snapshot.data.documents);
          },
        ),
      ),
    );
  }
}

class DrugList extends StatelessWidget {
  final List<DocumentSnapshot> documents;

  DrugList({this.documents});
  Widget build(BuildContext context) {
    return Center(
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
                                    'quantity : ${documents[position].data['quantity']}' +
                                "\n",
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
                            db.deleteDrug(documents[position].documentID);
                          }),
                      IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UpdateDrugsForm(documents[position])),
                            );
                          }),
                      IconButton(
                          icon:
                              Icon(Icons.add_shopping_cart, color: Colors.blue),
                          onPressed: () {
                            db.addToCart(
                                documents[position].data['name'],
                                documents[position].data['code'],
                                documents[position].data['price'],
                                documents[position].data['quantity'],
                                documents[position].data['location']);
                          }),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

void _createNewDrug(BuildContext context) async {
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddDrugs()),
  );
}
