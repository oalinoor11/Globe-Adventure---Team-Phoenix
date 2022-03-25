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
  ProfileModel({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.profession,
    this.address,
    this.partnerid,
    this.profilePicture,
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
      };

  @override
  String toString() {
    return 'CountryModel{id: $id, name: $name, phone: $phone, email: $email, profession: $profession, address: $address, partnerid: $partnerid}';
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
