import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

var user = firebase.auth().currentUser;

  user.updateprofile(selectedDoc, newValues) {
    Firestore.instance
        .collection('User')
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e) {
      print(e);
    });
  }