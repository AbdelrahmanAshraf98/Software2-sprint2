
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'drugClass.dart';

class DataBaseConnection{
final Firestore _firestore = Firestore.instance;

addDrugs(Drugs drug){
  _firestore.collection("Drugs").add({
    'name' : drug.drugName,
    'code' : drug.drugCode,
    'price' : drug.drugPrice,
    'quantity' : drug.drugQuantity,
    'location' : drug.drugLocation
  });
}

Stream <QuerySnapshot> loadDrugs(){
return _firestore.collection("Drugs").snapshots();
}

deleteDrug(documentId) {
  _firestore.collection("Drugs").document(documentId).delete();
}

editDrugs(data, documentId) {
  _firestore
      .collection('Drugs')
      .document(documentId)
      .updateData(data);
}
}



