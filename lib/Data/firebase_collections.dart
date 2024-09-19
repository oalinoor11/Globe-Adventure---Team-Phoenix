import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollections {
  static CollectionReference PROFILECOLLECTION = FirebaseFirestore.instance.collection("PROFILELIST");
  static CollectionReference NOTIFICATIONCOLLECTION = FirebaseFirestore.instance.collection("NOTIFICATIONLIST");
}
