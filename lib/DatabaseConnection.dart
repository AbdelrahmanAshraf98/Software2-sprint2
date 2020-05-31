
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'drugClass.dart';
import 'userclass.dart';
class DataBaseConnection{
final Firestore _firestore = Firestore.instance;
// Drug Class Database functions
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

updateDrugs(data, documentId) {
  _firestore
      .collection('Drugs')
      .document(documentId)
      .updateData(data);
}

// User Class database Functions
addUser(Users user){
_firestore.collection('Users').add({
  'username' : user.userName,
  'Email' : user.userEmail,
  'age' : user.userAge,
  'phone' : user.userPhone,
  'type': user.userType,});
}

  addToCart(name, code, price, quantity, location) {
    _firestore.collection("Cart").add({
      'name': name,
      'code': code,
      'price': price,
      'quantity': quantity,
      'location': location,
      'counter': 0,
    });
  }

  deleteFromCart(documentId) {
    _firestore.collection("Cart").document(documentId).delete();
  }
}




