import 'package:BornoBangla/Data/firebase_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CoachModel {
  String? id;
  late String name;
  late String price;
  late String image;
  late String description;
  late String title;
  late String videoId;
  CoachModel({
    this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.title,
    required this.videoId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'title': title,
      'videoId': videoId,
    };
  }

  factory CoachModel.fromMap(Map<String, dynamic> map) {
    return CoachModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      image: map['image'],
      description: map['description'],
      title: map['title'],
      videoId: map['videoId'],
    );
  }

  save() {
    FirebaseCollections.COACHCOLLECTION.doc(id).set(toMap());
  }

  static Stream<List<CoachModel>> getAll() {
    final List<CoachModel> list = [];
    return FirebaseCollections.COACHCOLLECTION.snapshots().map((snapshot) {
      snapshot.docs.forEach((doc) {
        list.add(CoachModel.fromMap(doc.data() as Map<String, dynamic>)
          ..id = doc.id);
      });
      return {...list}.toList();
    });
  }

  @override
  String toString() {
    return 'CoachModel{id: $id, name: $name, price: $price, image: $image, description: $description, title: $title, videoId: $videoId}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoachModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          price == other.price &&
          image == other.image &&
          description == other.description &&
          title == other.title &&
          videoId == other.videoId;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      price.hashCode ^
      image.hashCode ^
      description.hashCode ^
      title.hashCode ^
      videoId.hashCode;

  Update() {
    FirebaseCollections.COACHCOLLECTION.doc(id).update(toMap());
  }

  delete() {
    FirebaseCollections.COACHCOLLECTION.doc(id).delete();
  }
}
