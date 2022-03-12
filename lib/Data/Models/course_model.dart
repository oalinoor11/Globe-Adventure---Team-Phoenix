class CourseModel {
  late int admissionFees;
  late int tuitionFees;
  late String name;
  late String duration;
  late String level;
  late String currency;
  late String requirements;
  late String scholarship;

  CourseModel(
      {required this.admissionFees,
      required this.tuitionFees,
      required this.name,
      required this.level,
      required this.currency,
      required this.requirements,
      required this.scholarship,
      required this.duration});

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
        admissionFees: int.parse(json['admissionFees'].toString()),
        tuitionFees: int.parse(json['tuitionFees'].toString()),
        name: json['name'],
        level: json['level'],
        currency: json['currency'],
        requirements: json['requirements'],
        scholarship: json['scholarship'],
        duration: json['duration']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['admissionFees'] = this.admissionFees;
    data['tuitionFees'] = this.tuitionFees;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['level'] = this.level;
    data['currency'] = this.currency;
    data['requirements'] = this.requirements;
    data['scholarship'] = this.scholarship;
    return data;
  }

  @override
  String toString() {
    return 'CourseModel{admissionFees: $admissionFees, tuitionFees: $tuitionFees, name: $name, duration: $duration, currency: $currency, level: $level, requirements: $requirements, scholarship: $scholarship}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CourseModel &&
          runtimeType == other.runtimeType &&
          admissionFees == other.admissionFees &&
          tuitionFees == other.tuitionFees &&
          name == other.name &&
          duration == other.duration &&
          level == other.level &&
          currency == other.currency &&
          requirements == other.requirements &&
          scholarship == other.scholarship;

  @override
  int get hashCode =>
      admissionFees.hashCode ^
      tuitionFees.hashCode ^
      name.hashCode ^
      duration.hashCode ^
      level.hashCode ^
      currency.hashCode ^
      requirements.hashCode ^
      scholarship.hashCode;
}
