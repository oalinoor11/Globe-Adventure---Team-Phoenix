import 'package:BornoBangla/Data/firebase_collections.dart';

class BranchModel {
  String? id;
  late String name;
  BranchModel({
    this.id,
    required this.name,
  });

  BranchModel copyWith({
    String? id,
    String? name,
  }) {
    return BranchModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory BranchModel.fromMap(Map<String, dynamic> map) {
    return BranchModel(
      id: map['id'],
      name: map['name'],
    );
  }
  @override
  String toString() => 'BranchModel(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BranchModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  save() async {
    FirebaseCollections.BRANCHLIST.doc(id).set(toMap());
  }

  update() async {
    FirebaseCollections.BRANCHLIST.doc(id).update(toMap());
  }

  delete() async {
    FirebaseCollections.BRANCHLIST.doc(id).delete();
  }

  static Future<List<BranchModel>> getAll() async {
    var snapshot = await FirebaseCollections.BRANCHLIST.get();
    return snapshot.docs
        .map((doc) => BranchModel.fromMap(doc.data() as Map<String, dynamic>)
          ..id = doc.id)
        .toList();
  }

  static Stream<List<BranchModel>> getAllAsStream() {
    return FirebaseCollections.BRANCHLIST
        .orderBy('name', descending: false)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) =>
                  BranchModel.fromMap(doc.data() as Map<String, dynamic>)
                    ..id = doc.id)
              .toList(),
        );
  }
}
