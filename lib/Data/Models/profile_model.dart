import 'package:BornoBangla/Data/firebase_collections.dart';

class ProfileModel {
  String? id;
  late String name;
  late String phone;
  late String email;
  late String profession;
  late String address;
  late String partnerid;
  ProfileModel({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.profession,
    required this.address,
    required this.partnerid,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    profession: json["profession"],
    address: json["address"],
    partnerid: json["partnerid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "profession": profession,
    "address": address,
    "partnerid": partnerid,
  };

  @override
  String toString() {
    return 'CountryModel{id: $id, name: $name, phone: $phone, email: $email, profession: $profession, address: $address, partnerid: $partnerid}';
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
}
