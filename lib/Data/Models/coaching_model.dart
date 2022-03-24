import 'package:BornoBangla/Data/Models/coaching_course_model.dart';
import 'package:BornoBangla/Data/firebase_collections.dart';
import 'package:flutter/foundation.dart';

class CoachingModel {
  String? id;
  late String name;
  late String image;
  late String bannerImages;
  late String rating;
  List<CoachingCourseModel> courses = [];
  late String type;
  CoachingModel({
    this.id,
    required this.name,
    required this.image,
    required this.rating,
    required this.bannerImages,
    required this.courses,
    required this.type,
  });

  CoachingModel copyWith({
    String? id,
    String? name,
    String? image,
    String? bannerImages,
    String? rating,
    List<CoachingCourseModel>? courses,
    String? type,
  }) {
    return CoachingModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      rating: image ?? this.rating,
      bannerImages: bannerImages ?? this.bannerImages,
      courses: courses ?? this.courses,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'rating': rating,
      'bannerImages': bannerImages,
      'courses': courses.map((x) => x.toMap()).toList(),
      'type': type,
    };
  }

  factory CoachingModel.fromMap(Map<String, dynamic> map) {
    return CoachingModel(
      id: map['id'],
      name: map['name'],
      image: map['image'],
      bannerImages: map['bannerImages'],
      rating: map['rating'],
      courses: List<CoachingCourseModel>.from(
          map['courses']?.map((x) => CoachingCourseModel.fromMap(x))),
      type: map['type'],
    );
  }

  @override
  String toString() {
    return 'CoachingModel(id: $id, name: $name, image: $image, rating: $rating, bannerImages: $bannerImages, courses: $courses, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoachingModel &&
        other.id == id &&
        other.name == name &&
        other.rating == rating &&
        other.image == image &&
        other.bannerImages == bannerImages &&
        listEquals(other.courses, courses) &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        rating.hashCode ^
        bannerImages.hashCode ^
        courses.hashCode ^
        type.hashCode;
  }

  save() {
    FirebaseCollections.COACHINGCOLLECTION.doc(id).set(toMap());
  }

  update() {
    FirebaseCollections.COACHINGCOLLECTION.doc(id).update(toMap());
  }

  static Stream<List<CoachingModel>> getCoachingList(String type) {
    return FirebaseCollections.COACHINGCOLLECTION
        .where('type', isEqualTo: type)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return CoachingModel.fromMap(doc.data() as Map<String, dynamic>)
          ..id = doc.id;
      }).toList();
    });
  }

  delete() {
    FirebaseCollections.COACHINGCOLLECTION.doc(id).delete();
  }
}
