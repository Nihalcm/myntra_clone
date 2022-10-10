import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Sort extends ChangeNotifier{
  Stream<QuerySnapshot<Map<String, dynamic>>> Sorting=FirebaseFirestore.instance
      .collection('cloths').snapshots();
  get gethightolow{
    return Sorting;
  }
  hightolow() {
    Sorting = FirebaseFirestore.instance
        .collection('cloths').limit(6)
        .orderBy('price', descending: true)
        .snapshots();
    notifyListeners();
  }
  lowtohigh() {
    Sorting = FirebaseFirestore.instance
        .collection('cloths').limit(6)
        .orderBy('price', descending: false)
        .snapshots();
    notifyListeners();
  }
  discount() {
    Sorting = FirebaseFirestore.instance
        .collection('cloths').limit(6)
        .orderBy('offer', descending: true)
        .snapshots();
    notifyListeners();
  }
  rating() {
    Sorting = FirebaseFirestore.instance
        .collection('cloths').limit(6)
        .orderBy('rating', descending: true)
        .snapshots();
    notifyListeners();
  }
  Medium(){
    Sorting=FirebaseFirestore.instance.collection('products').where('size',isEqualTo: 'M').snapshots();
    notifyListeners();
  }
  Large(){
    Sorting=FirebaseFirestore.instance.collection('products').where('size',isEqualTo: 'L').snapshots();
    notifyListeners();
  }
  Small(){
    Sorting=FirebaseFirestore.instance.collection('products').where('size',isEqualTo: 'S').snapshots();
    notifyListeners();
  }
}