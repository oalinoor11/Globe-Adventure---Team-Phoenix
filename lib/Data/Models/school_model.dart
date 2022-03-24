import 'package:BornoBangla/Data/firebase_collections.dart';

class SchoolModel {
  String? id;
  late String name;
  late String rating;
  late String image;
  late String country;
  SchoolModel({
    this.id,
    required this.name,
    required this.rating,
    required this.image,
    required this.country,
  });

  factory SchoolModel.fromJson(Map<String, dynamic> json) => SchoolModel(
        id: json["id"],
        name: json["name"],
        rating: json["rating"],
        image: json["image"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rating": rating,
        "image": image,
        "country": country,
      };

  @override
  String toString() {
    return 'SchoolModel{id: $id, name: $name, rating: $rating, image: $image, country: $country}';
  }

  save() {
    FirebaseCollections.SCHOOLCOLLECTION.doc(id).set(toJson());
  }

  static Stream<List<SchoolModel>> getSchools(String country) {
    try {
      return FirebaseCollections.SCHOOLCOLLECTION
          .where('country', isEqualTo: country)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          return SchoolModel.fromJson(doc.data() as Map<String, dynamic>)
            ..id = doc.id;
        }).toList();
      });
    } on Exception catch (e) {
      rethrow;
    }
  }

  update() {
    FirebaseCollections.SCHOOLCOLLECTION.doc(id).update(toJson());
  }

  delete() {
    FirebaseCollections.SCHOOLCOLLECTION.doc(id).delete();
  }
}
