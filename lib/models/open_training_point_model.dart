import 'package:cloud_firestore/cloud_firestore.dart';

class OpenTrainingPointModel {
  final bool? open;
  final String? semester;
  final DateTime? time;

  OpenTrainingPointModel({
    this.semester,
    this.open,
    this.time,
  });

  factory OpenTrainingPointModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return OpenTrainingPointModel(
      open: data?['open'] as bool?,
      semester: data?['semester'] as String?,
      time: (data?['time'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (open != null) "open": open,
      if (semester != null) "semester": semester,
      if (time != null) "time": Timestamp.fromDate(time!),
    };
  }
}
