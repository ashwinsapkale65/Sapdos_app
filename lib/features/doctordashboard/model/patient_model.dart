class ScheduleItemModel {
  final DateTime time;
  final String patientName;
  final int age;
  final bool isDue;
  final bool isCompleted;
  final bool isPending;

  ScheduleItemModel({
    required this.time,
    required this.patientName,
    required this.age,
    this.isDue = false,
    this.isCompleted = false,
    this.isPending = false,
  });

  factory ScheduleItemModel.fromJson(Map<String, dynamic> json) {
    return ScheduleItemModel(
      time: DateTime.parse(json['time']),
      patientName: json['patientName'],
      age: json['age'],
      isDue: json['isDue'] ?? false,
      isCompleted: json['isCompleted'] ?? false,
      isPending: json['isPending'] ?? false,
    );
  }
}
