import 'dart:convert';

import 'package:BornoBangla/Data/Models/course_model.dart';
import 'package:BornoBangla/Data/Models/university_model.dart';
import 'package:BornoBangla/Data/firebase_collections.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppplyScholarshipFormModel {
  String? id;
  String _userId = FirebaseAuth.instance.currentUser?.uid ?? "testing";
  late String name;
  late String email;
  late String studentsPhone;
  late String parentsPhone;
  late String fathersName;
  late String mothersName;
  late String addressName;
  late String sscResult;
  late String hscResult;
  late String referralCode;
  late String image;
  late String signature;
  late CourseModel? course;
  late UniversityModel? university;

  AppplyScholarshipFormModel({
    this.id,
    required this.name,
    required this.email,
    required this.studentsPhone,
    required this.parentsPhone,
    required this.fathersName,
    required this.mothersName,
    required this.addressName,
    required this.sscResult,
    required this.hscResult,
    required this.referralCode,
    required this.image,
    required this.signature,
    required this.course,
    required this.university,
  });

  AppplyScholarshipFormModel copyWith({
    String? id,
    String? name,
    String? email,
    String? studentsPhone,
    String? parentsPhone,
    String? fathersName,
    String? mothersName,
    String? addressName,
    String? sscResult,
    String? hscResult,
    String? referralCode,
    String? image,
    String? signature,
    CourseModel? course,
    UniversityModel? university,
  }) {
    return AppplyScholarshipFormModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      studentsPhone: studentsPhone ?? this.studentsPhone,
      parentsPhone: parentsPhone ?? this.parentsPhone,
      fathersName: fathersName ?? this.fathersName,
      mothersName: mothersName ?? this.mothersName,
      addressName: addressName ?? this.addressName,
      sscResult: sscResult ?? this.sscResult,
      hscResult: hscResult ?? this.hscResult,
      referralCode: referralCode ?? this.referralCode,
      image: image ?? this.image,
      signature: signature ?? this.signature,
      course: course ?? this.course,
      university: university ?? this.university,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'studentsPhone': studentsPhone,
      'parentsPhone': parentsPhone,
      'fathersName': fathersName,
      'mothersName': mothersName,
      'addressName': addressName,
      'sscResult': sscResult,
      'hscResult': hscResult,
      'referralCode': referralCode,
      'image': image,
      'signature': signature,
      'course': course?.toJson(),
      'university': university?.toJson(),
    };
  }

  factory AppplyScholarshipFormModel.fromMap(Map<String, dynamic> map) {
    return AppplyScholarshipFormModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      studentsPhone: map['studentsPhone'],
      parentsPhone: map['parentsPhone'],
      fathersName: map['fathersName'],
      mothersName: map['mothersName'],
      addressName: map['addressName'],
      sscResult: map['sscResult'],
      hscResult: map['hscResult'],
      referralCode: map['referralCode'],
      image: map['image'],
      signature: map['signature'],
      course:
          map['course'] != null ? CourseModel.fromJson(map['course']) : null,
      university: map['university'] != null
          ? UniversityModel.fromJson(map['university'])
          : null,
    );
  }

  @override
  String toString() {
    return 'AppplyScholarshipFormModel(id: $id, name: $name, email: $email, studentsPhone: $studentsPhone, parentsPhone: $parentsPhone, fathersName: $fathersName, mothersName: $mothersName, addressName: $addressName, sscResult: $sscResult, hscResult: $hscResult, referralCode: $referralCode, image: $image, signature: $signature, course: $course, university: $university)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppplyScholarshipFormModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.studentsPhone == studentsPhone &&
        other.parentsPhone == parentsPhone &&
        other.fathersName == fathersName &&
        other.mothersName == mothersName &&
        other.addressName == addressName &&
        other.sscResult == sscResult &&
        other.hscResult == hscResult &&
        other.referralCode == referralCode &&
        other.image == image &&
        other.signature == signature &&
        other.course == course &&
        other.university == university;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        studentsPhone.hashCode ^
        parentsPhone.hashCode ^
        fathersName.hashCode ^
        mothersName.hashCode ^
        addressName.hashCode ^
        sscResult.hashCode ^
        hscResult.hashCode ^
        referralCode.hashCode ^
        image.hashCode ^
        signature.hashCode ^
        course.hashCode ^
        university.hashCode;
  }

  save() {
    FirebaseCollections.APPLYSCHOLARSHIPCOLLECTION.doc(id).set(toMap());
  }

  update() {
    FirebaseCollections.APPLYSCHOLARSHIPCOLLECTION.doc(id).update(toMap());
  }

  delete() {
    FirebaseCollections.APPLYSCHOLARSHIPCOLLECTION.doc(id).delete();
  }

  static Stream<List<AppplyScholarshipFormModel>> getAll() {
    return FirebaseCollections.APPLYSCHOLARSHIPCOLLECTION.snapshots().map(
        (snapshot) => snapshot.docs
            .map((doc) => AppplyScholarshipFormModel.fromMap(
                doc.data() as Map<String, dynamic>)
              ..id = doc.id)
            .toList());
  }
}
