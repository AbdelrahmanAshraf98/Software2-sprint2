import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';
import 'DatabaseConnection.dart';


class BigCart extends StatelessWidget {
  @override
  Widget ListItems(BuildContext context, DocumentSnapshot document) {
    return Padding(
      padding: const EdgeInsets.all(10),

      child: Container(
        child: FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 20,
            borderRadius: BorderRadius.circular(24.0),
            child: Row(
              children: <Widget>[
                Container(
                  height: 150,
                  width: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image.asset(
                      '${ document['location']}',
                      fit: BoxFit.contain,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ),

                Column(
                  children: <Widget>[

                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          document['name'].toString(),
                          style: TextStyle(fontSize: 50,
                              color: P_color),
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'price:${document['price'].toString()}LE',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: IconButton(
                              icon: Icon(Icons.remove,
                                color: Colors.red,),
                              onPressed: () {
                                if (document['counter'] > 0) {
                                  document.reference.updateData({
                                    'counter': document['counter'] - 1,
                                  });
                                }
                              },
                              iconSize: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              document['counter'].toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: IconButton(
                                icon: Icon(Icons.add),
                                color: Colors.blue,
                                onPressed: () {
                                  document.reference.updateData({
                                    'counter': document['counter'] + 1,
                                  });
                                },
                                iconSize: 40
                            ),
                          ),
                        ),
                      ],

                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: IconButton(
                      icon: Icon(Icons.close,
                          color: S_color),
                      onPressed: () {
                        DataBaseConnection().deleteFromCart(
                            document.documentID);
                      },
                      iconSize: 40,
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Text('My Cart'),
        backgroundColor: P_color,

      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection('Cart').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('loading !!!!!!');
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  ListItems(context, snapshot.data.documents[index]),
            );
          }
      ),
    );
  }
}


