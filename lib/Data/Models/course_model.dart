class CourseModel {
  late int admissionFees;
  late int tuitionFees;
  late String name;
  late String duration;

  CourseModel(
      {required this.admissionFees,
      required this.tuitionFees,
      required this.name,
      required this.duration});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
        admissionFees: int.parse(json['admissionFees'].toString()),
        tuitionFees: int.parse(json['tuitionFees'].toString()),
        name: json['name'],
        duration: json['duration']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admissionFees'] = this.admissionFees;
    data['tuitionFees'] = this.tuitionFees;
    data['name'] = this.name;
    data['duration'] = this.duration;
    return data;
  }
}
