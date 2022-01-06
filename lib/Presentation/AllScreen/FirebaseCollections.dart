import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseCollections{
  static CollectionReference ADMISSIONCOACHING = FirebaseFirestore.instance.collection("ADMISSIONCOACHING");
  static Reference COACHINGIMAGES = FirebaseStorage.instance.ref('coachingImages/');
}