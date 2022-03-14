import 'package:BornoBangla/Data/firebase_collections.dart';

class ProfileModel {
  String? id;
  late String name;
  late String phone;
  late String email;
  ProfileModel({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
  };

  @override
  String toString() {
    return 'CountryModel{id: $id, name: $name, phone: $phone, email: $email}';
  }

  save() {
    FirebaseCollections.PROFILECOLLECTION.doc(id).set(toJson());
  }

  static Stream<List<ProfileModel>> getCountries() {
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
