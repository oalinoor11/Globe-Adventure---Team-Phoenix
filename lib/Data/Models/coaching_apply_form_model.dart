import 'package:BornoBangla/Data/Models/coaching_course_model.dart';
import 'package:BornoBangla/Data/firebase_collections.dart';

class CoachingApplyFormModel {
  String? id;
  late String name;
  late String referral;
  late String fathersName;
  late String mothersName;
  late String studentsPhone;
  late String parentsPhone;
  late String email;
  late String address;
  late String sscResult;
  late String hscResult;
  late String coachingName;
  late CoachingCourseModel coachingCourse;
  late String branch;
  late String preferableTime;
  late String image;
  late String signatureImage;

  CoachingApplyFormModel({
    this.id,
    required this.name,
    required this.referral,
    required this.fathersName,
    required this.mothersName,
    required this.studentsPhone,
    required this.parentsPhone,
    required this.email,
    required this.address,
    required this.sscResult,
    required this.hscResult,
    required this.coachingName,
    required this.coachingCourse,
    required this.branch,
    required this.preferableTime,
    required this.image,
    required this.signatureImage,
  });

  CoachingApplyFormModel copyWith({
    String? id,
    String? name,
    String? referral,
    String? fathersName,
    String? mothersName,
    String? studentsPhone,
    String? parentsPhone,
    String? email,
    String? address,
    String? sscResult,
    String? hscResult,
    String? coachingName,
    CoachingCourseModel? coachingCourse,
    String? branch,
    String? preferableTime,
    String? image,
    String? signatureImage,
  }) {
    return CoachingApplyFormModel(
      id: id ?? this.id,
      name: name ?? this.name,
      referral: referral ?? this.referral,
      fathersName: fathersName ?? this.fathersName,
      mothersName: mothersName ?? this.mothersName,
      studentsPhone: studentsPhone ?? this.studentsPhone,
      parentsPhone: parentsPhone ?? this.parentsPhone,
      email: email ?? this.email,
      address: address ?? this.address,
      sscResult: sscResult ?? this.sscResult,
      hscResult: hscResult ?? this.hscResult,
      coachingName: coachingName ?? this.coachingName,
      coachingCourse: coachingCourse ?? this.coachingCourse,
      branch: branch ?? this.branch,
      preferableTime: preferableTime ?? this.preferableTime,
      image: image ?? this.image,
      signatureImage: signatureImage ?? this.signatureImage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'referral': referral,
      'fathersName': fathersName,
      'mothersName': mothersName,
      'studentsPhone': studentsPhone,
      'parentsPhone': parentsPhone,
      'email': email,
      'address': address,
      'sscResult': sscResult,
      'hscResult': hscResult,
      'coachingName': coachingName,
      'coachingCourse': coachingCourse.toMap(),
      'branch': branch,
      'preferableTime': preferableTime,
      'image': image,
      'signatureImage': signatureImage,
    };
  }

  factory CoachingApplyFormModel.fromMap(Map<String, dynamic> map) {
    return CoachingApplyFormModel(
      id: map['id'],
      name: map['name'],
      referral: map['referral'],
      fathersName: map['fathersName'],
      mothersName: map['mothersName'],
      studentsPhone: map['studentsPhone'],
      parentsPhone: map['parentsPhone'],
      email: map['email'],
      address: map['address'],
      sscResult: map['sscResult'],
      hscResult: map['hscResult'],
      coachingName: map['coachingName'],
      coachingCourse: CoachingCourseModel.fromMap(map['coachingCourse']),
      branch: map['branch'],
      preferableTime: map['preferableTime'],
      image: map['image'],
      signatureImage: map['signatureImage'],
    );
  }

  @override
  String toString() {
    return 'CoachingApplyFormModel(id: $id, name: $name, referral: $referral, fathersName: $fathersName, mothersName: $mothersName, studentsPhone: $studentsPhone, parentsPhone: $parentsPhone, email: $email, address: $address, sscResult: $sscResult, hscResult: $hscResult, coachingName: $coachingName, coachingCourse: $coachingCourse, branch: $branch, preferableTime: $preferableTime, image: $image, signatureImage: $signatureImage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoachingApplyFormModel &&
        other.id == id &&
        other.name == name &&
        other.referral == referral &&
        other.fathersName == fathersName &&
        other.mothersName == mothersName &&
        other.studentsPhone == studentsPhone &&
        other.parentsPhone == parentsPhone &&
        other.email == email &&
        other.address == address &&
        other.sscResult == sscResult &&
        other.hscResult == hscResult &&
        other.coachingName == coachingName &&
        other.coachingCourse == coachingCourse &&
        other.branch == branch &&
        other.preferableTime == preferableTime &&
        other.image == image &&
        other.signatureImage == signatureImage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        referral.hashCode ^
        fathersName.hashCode ^
        mothersName.hashCode ^
        studentsPhone.hashCode ^
        parentsPhone.hashCode ^
        email.hashCode ^
        address.hashCode ^
        sscResult.hashCode ^
        hscResult.hashCode ^
        coachingName.hashCode ^
        coachingCourse.hashCode ^
        branch.hashCode ^
        preferableTime.hashCode ^
        image.hashCode ^
        signatureImage.hashCode;
  }

  save() async {
    FirebaseCollections.APPLYCOACHINGCOLLECTION.doc(id).set(toMap());
  }

  update() async {
    FirebaseCollections.APPLYCOACHINGCOLLECTION.doc(id).update(toMap());
  }

  delete() async {
    FirebaseCollections.APPLYCOACHINGCOLLECTION.doc(id).delete();
  }

  static Future<List<CoachingApplyFormModel>> getAll() async {
    var snapshot = await FirebaseCollections.APPLYCOACHINGCOLLECTION.get();
    return snapshot.docs
        .map((doc) =>
            CoachingApplyFormModel.fromMap(doc.data() as Map<String, dynamic>)
              ..id = doc.id)
        .toList();
  }

  static Stream<List<CoachingApplyFormModel>> getAllAsStream() {
    return FirebaseCollections.APPLYCOACHINGCOLLECTION
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) =>
              CoachingApplyFormModel.fromMap(doc.data() as Map<String, dynamic>)
                ..id = doc.id)
          .toList();
    });
  }
}
