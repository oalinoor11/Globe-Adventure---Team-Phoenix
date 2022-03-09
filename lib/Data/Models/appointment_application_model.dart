import 'dart:convert';

import 'package:BornoBangla/Data/Models/coach_model.dart';
import 'package:BornoBangla/Data/firebase_collections.dart';

class AppointmentApplicationModel {
  String? id;
  late String name;
  late String phone;
  late String email;
  late String age;
  late String profession;
  late String purposeOfMeeting;
  late String image;
  late CoachModel coachModel;
  AppointmentApplicationModel({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.age,
    required this.profession,
    required this.purposeOfMeeting,
    required this.image,
    required this.coachModel,
  });

  AppointmentApplicationModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? age,
    String? profession,
    String? purposeOfMeeting,
    String? image,
    CoachModel? coachModel,
  }) {
    return AppointmentApplicationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      age: age ?? this.age,
      profession: profession ?? this.profession,
      purposeOfMeeting: purposeOfMeeting ?? this.purposeOfMeeting,
      image: image ?? this.image,
      coachModel: coachModel ?? this.coachModel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'age': age,
      'profession': profession,
      'purposeOfMeeting': purposeOfMeeting,
      'image': image,
      'coachModel': coachModel.toMap(),
    };
  }

  factory AppointmentApplicationModel.fromMap(Map<String, dynamic> map) {
    return AppointmentApplicationModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      age: map['age'],
      profession: map['profession'],
      purposeOfMeeting: map['purposeOfMeeting'],
      image: map['image'],
      coachModel: CoachModel.fromMap(map['coachModel']),
    );
  }
  @override
  String toString() {
    return 'AppointmentApplicationModel(id: $id, name: $name, phone: $phone, email: $email, age: $age, profession: $profession, purposeOfMeeting: $purposeOfMeeting, image: $image, coachModel: $coachModel)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppointmentApplicationModel &&
        other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.age == age &&
        other.profession == profession &&
        other.purposeOfMeeting == purposeOfMeeting &&
        other.image == image &&
        other.coachModel == coachModel;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        age.hashCode ^
        profession.hashCode ^
        purposeOfMeeting.hashCode ^
        image.hashCode ^
        coachModel.hashCode;
  }

  save() async {
    FirebaseCollections.APPLICATIONCOACHCOLLECTION.doc(id).set(toMap());
  }

  update() async {
    FirebaseCollections.APPLICATIONCOACHCOLLECTION.doc(id).update(toMap());
  }

  delete() async {
    FirebaseCollections.APPLICATIONCOACHCOLLECTION.doc(id).delete();
  }

  static Stream<List<AppointmentApplicationModel>> getAll() {
    return FirebaseCollections.APPLICATIONCOACHCOLLECTION.snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => AppointmentApplicationModel.fromMap(
                  doc.data() as Map<String, dynamic>))
              .toList(),
        );
  }
}
