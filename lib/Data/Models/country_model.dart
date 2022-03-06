import 'package:BornoBangla/Data/firebase_collections.dart';

class CountryModel {
  String? id;
  late String name;
  late String image;
  CountryModel({
    this.id,
    required this.name,
    required this.image,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };

  @override
  String toString() {
    return 'CountryModel{id: $id, name: $name, image: $image}';
  }

  save() {
    FirebaseCollections.COUNTRYCOLLECTION.doc(id).set(toJson());
  }

  static Stream<List<CountryModel>> getUniversities(String country) {
    try {
      return FirebaseCollections.UNIVERSITYCOLLECTION
          .where('country', isEqualTo: country)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          return CountryModel.fromJson(doc.data() as Map<String, dynamic>)
            ..id = doc.id;
        }).toList();
      });
    } on Exception catch (e) {
      rethrow;
    }
  }

  update() {
    FirebaseCollections.COUNTRYCOLLECTION.doc(id).update(toJson());
  }

  delete() {
    FirebaseCollections.COUNTRYCOLLECTION.doc(id).delete();
  }
}
