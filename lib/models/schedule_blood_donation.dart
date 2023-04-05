class ScheduleBloodDonation {
  DateTime date;
  DateTime startTime;
  DateTime endTime;
  num amountBlood;
  String place;
  String name;

  ScheduleBloodDonation(
      {required this.date,
      required this.startTime,
      required this.endTime,
      required this.amountBlood,
      required this.place,
      required this.name});

  ScheduleBloodDonation.fromJson(Map<String, dynamic> json)
      : date = DateTime.parse(json['date'] ?? ""),
        startTime = DateTime.parse(json['startTime'] ?? ""),
        endTime = DateTime.parse(json['endTime'] ?? ""),
        amountBlood = json['amountBlood'] ?? "",
        place = json['place'] ?? "",
        name = json['name'] ?? "";

  Map<String, dynamic> toJson() => {
        'date': date.toIso8601String(),
        'startTime': startTime.toIso8601String(),
        'endTime': endTime.toIso8601String(),
        'amountBlood': amountBlood,
        'place': place,
        'name': name,
      };
}
