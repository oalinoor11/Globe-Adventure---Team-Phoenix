import '../firebase_collections.dart';

class ProfileModel {
  String? id;
  String email;
  late String name;
  String? photoID;
  String? image;
  String? bloodGroup;
  String? profession;
  String? workplace;
  String? dob;
  String? presentAddress;
  String? permanentAddress;
  String? phone;
  String? status;
  String? statusDetails;
  String? validity;
  String? verified;
  String? designation;
  String? memberId;
  String? emergencyContactPerson;
  String? emergencyContactRelation;
  String? emergencyContactPhone;
  String? role;
  String? signedUp;

  ProfileModel({
    this.id,
    required this.email,
    required this.name,
    this.photoID,
    this.image,
    this.bloodGroup,
    this.profession,
    this.workplace,
    this.dob,
    this.presentAddress,
    this.permanentAddress,
    required this.phone,
    this.status,
    this.statusDetails,
    this.validity,
    this.verified,
    this.designation,
    this.memberId,
    this.emergencyContactPerson,
    this.emergencyContactRelation,
    this.emergencyContactPhone,
    this.role,
    this.signedUp,
  });

  ProfileModel copyWith({
    String? id,
    String? email,
    String? name,
    String? photoID,
    String? image,
    String? bloodGroup,
    String? profession,
    String? workplace,
    String? dob,
    String? presentAddress,
    String? permanentAddress,
    String? phone,
    String? status,
    String? statusDetails,
    String? validity,
    String? verified,
    String? designation,
    String? memberId,
    String? emergencyContactPerson,
    String? emergencyContactRelation,
    String? emergencyContactPhone,
    String? role,
    String? signedUp,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      photoID: photoID ?? this.photoID,
      image: image ?? this.image,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      profession: profession ?? this.profession,
      workplace: workplace ?? this.workplace,
      dob: dob ?? this.dob,
      presentAddress: presentAddress ?? this.presentAddress,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      statusDetails: statusDetails ?? this.statusDetails,
      validity: validity ?? this.validity,
      verified: verified ?? this.verified,
      designation: designation ?? this.designation,
      memberId: memberId ?? this.memberId,
      emergencyContactPerson: emergencyContactPerson ?? this.emergencyContactPerson,
      emergencyContactRelation: emergencyContactRelation ?? this.emergencyContactRelation,
      emergencyContactPhone: emergencyContactPhone ?? this.emergencyContactPhone,
      role: role ?? this.role,
      signedUp: signedUp ?? this.signedUp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
          "id": id,
          "email": email,
          "name": name,
          "photoID": photoID,
          "image": image,
          "bloodGroup": bloodGroup,
          "profession": profession,
          "workplace": workplace,
          "dob": dob,
          "presentAddress": presentAddress,
          "permanentAddress": permanentAddress,
          "phone": phone,
          "status": status,
          "statusDetails": statusDetails,
          "validity": validity,
          "verified": verified,
          "designation": designation,
          "memberId": memberId,
          "emergencyContactPerson": emergencyContactPerson,
          "emergencyContactRelation": emergencyContactRelation,
          "emergencyContactPhone": emergencyContactPhone,
          "role": role,
          "signedUp": signedUp,
        };
      }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
       return ProfileModel(
        id: map["id"],
         email: map["email"],
        name: map["name"],
         photoID: map["photoID"],
         image: map["image"],
         bloodGroup: map["bloodGroup"],
         profession: map["profession"],
         workplace: map["workplace"],
         dob: map["dob"],
         presentAddress: map["presentAddress"],
         permanentAddress: map["permanentAddress"],
         phone: map["phone"] ?? "",
         status: map["status"] ?? "",
         statusDetails: map["statusDetails"] ?? "",
         validity: map["validity"] ?? "",
         verified: map["verified"] ?? "",
         designation: map["designation"] ?? "",
         memberId: map["memberId"] ?? "",
         emergencyContactPerson: map["emergencyContactPerson"] ?? "",
         emergencyContactRelation: map["emergencyContactRelation"],
         emergencyContactPhone: map["emergencyContactPhone"],
         role: map["role"],
         signedUp: map["signedUp"],
      );
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json["id"],
      email: json["email"],
      name: json["name"],
      photoID: json["photoID"],
      image: json["image"],
      bloodGroup: json["bloodGroup"],
      profession: json["profession"],
      workplace: json["workplace"],
      dob: json["dob"],
      presentAddress: json["presentAddress"],
      permanentAddress: json["permanentAddress"],
      phone: json["phone"] ?? "",
      status: json["status"] ?? "",
      statusDetails: json["statusDetails"] ?? "",
      validity: json["validity"] ?? "",
      verified: json["verified"] ?? "",
      designation: json["designation"] ?? "",
      memberId: json["memberId"] ?? "",
      emergencyContactPerson: json["emergencyContactPerson"] ?? "",
      emergencyContactRelation: json["emergencyContactRelation"],
      emergencyContactPhone: json["emergencyContactPhone"],
      role: json["role"],
      signedUp: json["signedUp"],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProfileModel &&
        other.id == id &&
        other.email == email &&
        other.name == name &&
        other.photoID == photoID &&
        other.image == image &&
        other.bloodGroup == bloodGroup &&
        other.profession == profession &&
        other.workplace == workplace &&
        other.dob == dob &&
        other.presentAddress == presentAddress &&
        other.permanentAddress == permanentAddress &&
        other.phone == phone &&
        other.status == status &&
        other.statusDetails == statusDetails &&
        other.validity == validity &&
        other.verified == verified &&
        other.designation == designation &&
        other.memberId == memberId &&
        other.emergencyContactPerson == emergencyContactPerson &&
        other.emergencyContactRelation == emergencyContactRelation &&
        other.emergencyContactPhone == emergencyContactPhone &&
        other.role == role &&
        other.signedUp == signedUp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    email.hashCode ^
    name.hashCode ^
    photoID.hashCode ^
    image.hashCode ^
    bloodGroup.hashCode ^
    profession.hashCode ^
    workplace.hashCode ^
    dob.hashCode ^
    presentAddress.hashCode ^
    permanentAddress.hashCode ^
    phone.hashCode ^
    status.hashCode ^
    statusDetails.hashCode ^
    validity.hashCode ^
    verified.hashCode ^
    designation.hashCode ^
    memberId.hashCode ^
    emergencyContactPerson.hashCode ^
    emergencyContactRelation.hashCode ^
    emergencyContactPhone.hashCode ^
    role.hashCode ^
    signedUp.hashCode;
  }


  @override
  String toString() {
    return 'ProfileModel{id: $id, email: $email, name: $name, photoID: $photoID, image: $image, bloodGroup: $bloodGroup, profession: $profession, workplace: $workplace, dob: $dob, presentAddress: $presentAddress, permanentAddress: $permanentAddress, phone: $phone, status: $status, statusDetails: $statusDetails, validity: $validity, verified: $verified, designation: $designation, memberId: $memberId, emergencyContactPerson: $emergencyContactPerson, emergencyContactRelation: $emergencyContactRelation, emergencyContactPhone: $emergencyContactPhone, role: $role, signedUp: $signedUp}';
  }

  save() {
    FirebaseCollections.PROFILECOLLECTION.doc(id).set(toMap());
  }

  update() {
  FirebaseCollections.PROFILECOLLECTION.doc(id).update(toMap());
  }

  static Stream<List<ProfileModel>> getProfiles() {
    try {
      return FirebaseCollections.PROFILECOLLECTION.snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return ProfileModel.fromMap(doc.data() as Map<String, dynamic>)
            ..id = doc.id;
        }).toList();
      });
    } on Exception catch (e) {
      rethrow;
    }
  }

  static getUserByEmail({required String email}) async {
    try {
      return ProfileModel.fromMap(
          (await FirebaseCollections.PROFILECOLLECTION
              .where('email', isEqualTo: email)
              .get())
              .docs
              .first
              .data()
          as Map<String, dynamic>);
    } on Exception {
      rethrow;
    }
  }
  static Stream<List<ProfileModel>> getVerifiedUsers() {
    try {
      return FirebaseCollections.PROFILECOLLECTION
          .where("verified", isEqualTo: "true")
          .snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return ProfileModel.fromJson(doc.data() as Map<String, dynamic>)
            ..id = doc.id;
        }).toList();
      });
    } on Exception catch (e) {
      rethrow;
    }
  }
  static Stream<List<ProfileModel>> getActiveUsers() {
    try {
      return FirebaseCollections.PROFILECOLLECTION
          .where("status", isEqualTo: "Active")
          .snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return ProfileModel.fromJson(doc.data() as Map<String, dynamic>)
            ..id = doc.id;
        }).toList();
      });
    } on Exception catch (e) {
      rethrow;
    }
  }
  static Stream<List<ProfileModel>> getUserById(String userID) {
    try {
      return FirebaseCollections.PROFILECOLLECTION
          .where("id", isEqualTo: userID)
          .snapshots().map((snapshot) {
        return snapshot.docs.map((doc) {
          return ProfileModel.fromJson(doc.data() as Map<String, dynamic>)
            ..id = doc.id;
        }).toList();
      });
    } on Exception catch (e) {
      rethrow;
    }
  }

  delete() {
    FirebaseCollections.PROFILECOLLECTION.doc(id).delete();
  }

  static getProfileByUserId({required String uId}) async {
    try {
      return ProfileModel.fromMap(
          (await FirebaseCollections.PROFILECOLLECTION.doc(uId).get()).data()
              as Map<String, dynamic>);
    } on Exception {
      rethrow;
    }
  }
}
