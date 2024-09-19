import '../firebase_collections.dart';

class NotificationModel {
  String? id;
  late String title;
  late String description;
  late String image;
  late String timeStamps;
  NotificationModel({
    this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.timeStamps,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    timeStamps: json["timeStamps"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
    "timeStamps": timeStamps,
  };

  @override
  String toString() {
    return 'NotificationModel{id: $id, title: $title, description: $description, image: $image, timeStamps: $timeStamps}';
  }

  save() {
    FirebaseCollections.NOTIFICATIONCOLLECTION.doc(id).set(toJson());
  }



  static Stream<List<NotificationModel>> getNotification() {
    try {
      return FirebaseCollections.NOTIFICATIONCOLLECTION
          .orderBy("timeStamps", descending: true)
          .snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return NotificationModel.fromJson(doc.data() as Map<String, dynamic>)
            ..id = doc.id;
        }).toList();
      });
    } on Exception {
      rethrow;
    }
  }

  update() {
    FirebaseCollections.NOTIFICATIONCOLLECTION.doc(id).update(toJson());
  }

  delete() {
    FirebaseCollections.NOTIFICATIONCOLLECTION.doc(id).delete();
  }
}
