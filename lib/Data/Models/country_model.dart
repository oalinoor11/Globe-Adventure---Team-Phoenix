import 'package:BornoBangla/Data/firebase_collections.dart';

class CountryModel {
  String? id;
  late String countryName;
  late String countryFlag;
  CountryModel({
    this.id,
    required this.countryName,
    required this.countryFlag,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json["id"],
        countryName: json["countryName"],
        countryFlag: json["countryFlag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "countryName": countryName,
        "countryFlag": countryFlag,
      };

  @override
  String toString() {
    return 'CountryModel{id: $id, countryName: $countryName, countryFlag: $countryFlag}';
  }

  save() {
    FirebaseCollections.COUNTRYCOLLECTION.doc(id).set(toJson());
  }

  static Stream<List<CountryModel>> getCountries() {
    try {
      return FirebaseCollections.COUNTRYCOLLECTION.snapshots().map((snapshot) {
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
