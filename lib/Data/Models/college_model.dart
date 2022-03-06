import 'package:BornoBangla/Data/firebase_collections.dart';

class CollegeModel {
  String? id;
  late String name;
  late String image;
  CollegeModel({
    this.id,
    required this.name,
    required this.image,
  });

  factory CollegeModel.fromJson(Map<String, dynamic> json) => CollegeModel(
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
    return 'CollegeModel{id: $id, name: $name, image: $image}';
  }

  save() {
    FirebaseCollections.COLLEGECOLLECTION.doc(id).set(toJson());
  }

  static Stream<List<CollegeModel>> getUniversities(String country) {
    try {
      return FirebaseCollections.COLLEGECOLLECTION
          .where('country', isEqualTo: country)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          return CollegeModel.fromJson(doc.data() as Map<String, dynamic>)
            ..id = doc.id;
        }).toList();
      });
    } on Exception catch (e) {
      rethrow;
    }
  }

  update() {
    FirebaseCollections.COLLEGECOLLECTION.doc(id).update(toJson());
  }

  delete() {
    FirebaseCollections.COLLEGECOLLECTION.doc(id).delete();
  }
}
