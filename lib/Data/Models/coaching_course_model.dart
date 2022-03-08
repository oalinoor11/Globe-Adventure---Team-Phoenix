import 'dart:convert';

class CoachingCourseModel {
  late String name;
  late String image;
  late int regularCourseFee;
  int? discountedCourseFee;
  CoachingCourseModel({
    required this.name,
    required this.image,
    required this.regularCourseFee,
    this.discountedCourseFee,
  });

  CoachingCourseModel copyWith({
    String? name,
    String? image,
    int? regularCourseFee,
    int? discountedCourseFee,
    String? type,
  }) {
    return CoachingCourseModel(
      name: name ?? this.name,
      image: image ?? this.image,
      regularCourseFee: regularCourseFee ?? this.regularCourseFee,
      discountedCourseFee: discountedCourseFee ?? this.discountedCourseFee,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'regularCourseFee': regularCourseFee,
      'discountedCourseFee': discountedCourseFee,
    };
  }

  factory CoachingCourseModel.fromMap(Map<String, dynamic> map) {
    return CoachingCourseModel(
      name: map['name'],
      image: map['image'],
      regularCourseFee: int.parse(map['regularCourseFee'].toString()),
      discountedCourseFee: map['discountedCourseFee']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CoachingCourseModel.fromJson(String source) =>
      CoachingCourseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CoachingCourseModel(name: $name, image: $image, regularCourseFee: $regularCourseFee, discountedCourseFee: $discountedCourseFee)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CoachingCourseModel &&
        other.name == name &&
        other.image == image &&
        other.regularCourseFee == regularCourseFee &&
        other.discountedCourseFee == discountedCourseFee;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        image.hashCode ^
        regularCourseFee.hashCode ^
        discountedCourseFee.hashCode;
  }
}
