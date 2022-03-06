import 'package:BornoBangla/Data/firebase_collections.dart';
import 'package:BornoBangla/Presentation/Controllers/university.dart';

import 'course_model.dart';

class UniversityModel {
  String? id;
  late String name;
  late String image;
  late String country;
  List<CourseModel> courseList = [];

  UniversityModel(
      {this.id,
      required this.name,
      required this.image,
      required this.country,
      required this.courseList});

  factory UniversityModel.fromJson(Map<String, dynamic> json) {
    return UniversityModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      country: json['country'],
      courseList: (json['courseList'] as List)
          .map((i) => CourseModel.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['country'] = this.country;
    data['courseList'] = this.courseList.map((i) => i.toJson()).toList();
    return data;
  }

  @override
  String toString() {
    return 'UniversityModel{id: $id, name: $name, image: $image, Country: $country, courseList: $courseList}';
  }

  static Stream<List<UniversityModel>> getUniversities(String country) {
    try {
      return FirebaseCollections.UNIVERSITYCOLLECTION
          .where('country', isEqualTo: country)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          return UniversityModel.fromJson(doc.data() as Map<String, dynamic>)
            ..id = doc.id;
        }).toList();
      });
    } on Exception catch (e) {
      rethrow;
    }
  }

  save() {
    FirebaseCollections.UNIVERSITYCOLLECTION.doc(id).set(toJson());
  }

  delete() {
    FirebaseCollections.UNIVERSITYCOLLECTION.doc(id).delete();
  }

  static Future<UniversityModel> getUniversity(String id) {
    return FirebaseCollections.UNIVERSITYCOLLECTION.doc(id).get().then((doc) {
      return UniversityModel.fromJson(doc.data() as Map<String, dynamic>);
    });
  }

  update() {
    FirebaseCollections.UNIVERSITYCOLLECTION.doc(id).update(toJson());
  }
}
