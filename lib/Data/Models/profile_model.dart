import 'package:BornoBangla/Data/firebase_collections.dart';

class ProfileModel {
  String? id;
  late String name;
  late String phone;
  late String email;
  String? profession;
  String? address;
  String? partnerid;
  String? profilePicture;
  String? fatherName;
  String? motherName;
  String? parentPhone;
  double? sscResult;
  double? hscResult;
  String? signatureImage;
  int? age;
  ProfileModel({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.profession,
    this.address,
    this.partnerid,
    this.profilePicture,
    this.fatherName,
    this.motherName,
    this.parentPhone,
    this.sscResult,
    this.hscResult,
    this.signatureImage,
    this.age,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        profession: json["profession"],
        address: json["address"],
        partnerid: json["partnerid"],
        profilePicture: json["profilePicture"],
        fatherName: json["fatherName"],
        motherName: json["motherName"],
        parentPhone: json["parentPhone"],
        sscResult: json["sscResult"],
        hscResult: json["hscResult"],
        signatureImage: json["signatureImage"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "profession": profession,
        "address": address,
        "partnerid": partnerid,
        "profilePicture": profilePicture,
        "fatherName": fatherName,
        "motherName": motherName,
        "parentPhone": parentPhone,
        "sscResult": sscResult,
        "hscResult": hscResult,
        "signatureImage": signatureImage,
        "age": age,
      };

  @override
  String toString() {
    return 'CountryModel{id: $id, name: $name, phone: $phone, email: $email, profession: $profession, address: $address, partnerid: $partnerid, profilePicture: $profilePicture, fatherName: $fatherName, motherName: $motherName, parentPhone: $parentPhone, sscResult: $sscResult, hscResult: $hscResult, signatureImage: $signatureImage, age: $age}';
  }

  ProfileModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? profession,
    String? address,
    String? partnerid,
    String? profilePicture,
    String? fatherName,
    String? motherName,
    String? parentPhone,
    double? sscResult,
    double? hscResult,
    String? signatureImage,
    int? age,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      profession: profession ?? this.profession,
      address: address ?? this.address,
      partnerid: partnerid ?? this.partnerid,
      profilePicture: profilePicture ?? this.profilePicture,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      parentPhone: parentPhone ?? this.parentPhone,
      sscResult: sscResult ?? this.sscResult,
      hscResult: hscResult ?? this.hscResult,
      signatureImage: signatureImage ?? this.signatureImage,
      age: age ?? this.age,
    );
  }

  save() {
    FirebaseCollections.PROFILECOLLECTION.doc(id).set(toJson());
  }

  static Stream<List<ProfileModel>> getProfiles() {
    try {
      return FirebaseCollections.PROFILECOLLECTION.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return ProfileModel.fromJson(doc.data() as Map<String, dynamic>)
            ..id = doc.id;
        }).toList();
      });
    } on Exception catch (e) {
      rethrow;
    }
  }

  update() {
    FirebaseCollections.PROFILECOLLECTION.doc(id).update(toJson());
  }

  delete() {
    FirebaseCollections.PROFILECOLLECTION.doc(id).delete();
  }

  static getProfileByUserId({required String uId}) async {
    try {
      return ProfileModel.fromJson(
          (await FirebaseCollections.PROFILECOLLECTION.doc(uId).get()).data()
              as Map<String, dynamic>);
    } on Exception {
      rethrow;
    }
  }
}
