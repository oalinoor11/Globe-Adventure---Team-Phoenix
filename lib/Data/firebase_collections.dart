import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseCollections {
  static CollectionReference COUNTRYCOLLECTION =
      FirebaseFirestore.instance.collection("COUNTRYLIST");
  static CollectionReference SCHOOLCOLLECTION =
      FirebaseFirestore.instance.collection("SCHOOLLIST");
  static CollectionReference COLLEGECOLLECTION =
      FirebaseFirestore.instance.collection("COLLEGELIST");
}
