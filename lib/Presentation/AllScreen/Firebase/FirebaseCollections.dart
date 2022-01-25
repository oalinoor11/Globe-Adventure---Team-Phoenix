import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';


class FirebaseCollections{
  static CollectionReference ADMISSIONCOACHING = FirebaseFirestore.instance.collection("ADMISSIONCOACHING");
  static Reference COACHINGIMAGES = FirebaseStorage.instance.ref('coachingImages/');

  static uploadCoachingLogo (File image, String path) async {
    Reference fileReference =  FirebaseStorage.instance.ref('Preparation/AdmissionCoaching/Logo/'+path);
    Reference imageReference = (await fileReference.putFile(image)).ref;
    return await imageReference.getDownloadURL();
  }
}

