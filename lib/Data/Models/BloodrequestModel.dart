import '../firebase_collections.dart';

class BloodRequestModel {
  String? id;
  late String bloodGroup;
  late String description;
  late String bags;
  late String location;
  late String time;
  late String phone;
  late String requestedById;
  late String requestedByName;
  late String status;
  late String statusDetails;
  late String donnerId;
  late String donnerName;
  late String donnerImage;
  late String donnerPhone;
  late String timeStamps;
  BloodRequestModel({
    this.id,
    required this.bloodGroup,
    required this.description,
    required this.bags,
    required this.location,
    required this.time,
    required this.phone,
    required this.requestedById,
    required this.requestedByName,
    required this.status,
    required this.statusDetails,
    required this.donnerId,
    required this.donnerName,
    required this.donnerImage,
    required this.donnerPhone,
    required this.timeStamps,
  });

  factory BloodRequestModel.fromJson(Map<String, dynamic> json) => BloodRequestModel(
    id: json["id"],
    bloodGroup: json["bloodGroup"],
    description: json["description"],
    bags: json["bags"],
    location: json["location"],
    time: json["time"],
    phone: json["phone"],
    requestedById: json["requestedById"],
    requestedByName: json["requestedByName"],
    status: json["status"],
    statusDetails: json["statusDetails"],
    donnerId: json["donnerId"],
    donnerImage: json["donnerImage"],
    donnerPhone: json["donnerPhone"],
    donnerName: json["donnerName"],
    timeStamps: json["timeStamps"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bloodGroup": bloodGroup,
    "description": description,
    "bags": bags,
    "location": location,
    "time": time,
    "phone": phone,
    "requestedById": requestedById,
    "requestedByName": requestedByName,
    "status": status,
    "statusDetails": statusDetails,
    "donnerId": donnerId,
    "donnerImage": donnerImage,
    "donnerPhone": donnerPhone,
    "donnerName": donnerName,
    "timeStamps": timeStamps,
  };

  @override
  String toString() {
    return 'BloodRequestModel{id: $id, bloodGroup: $bloodGroup, donnerPhone: $donnerPhone, donnerImage: $donnerImage, description: $description, bags: $bags, location: $location, time: $time, phone: $phone, requestedById: $requestedById, requestedByName: $requestedByName, status: $status, statusDetails: $statusDetails, donnerId: $donnerId, donnerName: $donnerName, timeStamps: $timeStamps}';
  }

  save() {
    FirebaseCollections.BLOODREQUESTCOLLECTION.doc(id).set(toJson());
  }



  static Stream<List<BloodRequestModel>> getRequests() {
    try {
      return FirebaseCollections.BLOODREQUESTCOLLECTION
          .orderBy("timeStamps", descending: true)
          .snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return BloodRequestModel.fromJson(doc.data() as Map<String, dynamic>)
            ..id = doc.id;
        }).toList();
      });
    } on Exception {
      rethrow;
    }
  }

  static Stream<List<BloodRequestModel>> getActiveRequests() {
    try {
      return FirebaseCollections.BLOODREQUESTCOLLECTION
          .where("status", isNotEqualTo: "Completed")
          .snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return BloodRequestModel.fromJson(doc.data() as Map<String, dynamic>)
            ..id = doc.id;
        }).toList();
      });
    } on Exception catch (e) {
      rethrow;
    }
  }

  update() {
    FirebaseCollections.BLOODREQUESTCOLLECTION.doc(id).update(toJson());
  }

  delete() {
    FirebaseCollections.BLOODREQUESTCOLLECTION.doc(id).delete();
  }
}
