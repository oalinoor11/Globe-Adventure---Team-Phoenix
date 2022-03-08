import 'package:BornoBangla/Data/Models/university_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseCollections {
  static CollectionReference COUNTRYCOLLECTION =
      FirebaseFirestore.instance.collection("COUNTRYLIST");
  static CollectionReference SCHOOLCOLLECTION =
      FirebaseFirestore.instance.collection("SCHOOLLIST");
  static CollectionReference COLLEGECOLLECTION =
      FirebaseFirestore.instance.collection("COLLEGELIST");

  static CollectionReference UNIVERSITYCOLLECTION =
      FirebaseFirestore.instance.collection("UNIVERSITYLIST");
  static CollectionReference COACHCOLLECTION =
      FirebaseFirestore.instance.collection("COACHLIST");
  static CollectionReference SCHOLARSHIPCOLLECTION =
      FirebaseFirestore.instance.collection("SCHOLARSHIPLIST");
  static CollectionReference COACHINGCOLLECTION =
      FirebaseFirestore.instance.collection("COACHINGLIST");
  static CollectionReference APPLYSCHOLARSHIPCOLLECTION =
      FirebaseFirestore.instance.collection("APPLYSCHOLARSHIPLIST");
}
