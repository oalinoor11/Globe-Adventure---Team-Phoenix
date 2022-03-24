import 'package:BornoBangla/Data/firebase_collections.dart';

class ScholarshipModel {
  String? id;
  late String name;
  late String applicationLink;
  late String videoId;
  late String? university;
  late String? course;
  ScholarshipModel({
    this.id,
    required this.name,
    required this.applicationLink,
    required this.videoId,
    required this.university,
    required this.course,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScholarshipModel &&
        other.id == id &&
        other.name == name &&
        other.applicationLink == applicationLink &&
        other.videoId == videoId &&
        other.university == university &&
        other.course == course;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        applicationLink.hashCode ^
        videoId.hashCode ^
        university.hashCode ^
        course.hashCode;
  }

  @override
  String toString() {
    return 'ScholarshipModel(id: $id, name: $name, applicationLink: $applicationLink, videoId: $videoId, university: $university, course: $course)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'applicationLink': applicationLink,
      'videoId': videoId,
      'university': university,
      'course': course,
    };
  }

  factory ScholarshipModel.fromMap(Map<String, dynamic> map) {
    return ScholarshipModel(
      id: map['id'],
      name: map['name'],
      applicationLink: map['applicationLink'],
      videoId: map['videoId'],
      university: map['university'],
      course: map['course'],
    );
  }

  ScholarshipModel copyWith({
    String? id,
    String? name,
    String? applicationLink,
    String? videoId,
    String? university,
    String? course,
  }) {
    return ScholarshipModel(
      id: id ?? this.id,
      name: name ?? this.name,
      applicationLink: applicationLink ?? this.applicationLink,
      videoId: videoId ?? this.videoId,
      university: university ?? this.university,
      course: course ?? this.course,
    );
  }

  save() async {
    await FirebaseCollections.SCHOLARSHIPCOLLECTION.doc(id).set(toMap());
  }

  update() async {
    await FirebaseCollections.SCHOLARSHIPCOLLECTION.doc(id).update(toMap());
  }

  delete() async {
    await FirebaseCollections.SCHOLARSHIPCOLLECTION.doc(id).delete();
  }

  static Stream<List<ScholarshipModel>> getAll() {
    return FirebaseCollections.SCHOLARSHIPCOLLECTION
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ScholarshipModel.fromMap(doc.data() as Map<String, dynamic>)
          ..id = doc.id;
      }).toList();
    });
  }
}
