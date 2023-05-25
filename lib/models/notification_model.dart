import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String? name;
  final String? email;
  final String? title;
  final String? msv;
  final String? describe;
  final DateTime? time;

  NotificationModel({
    this.title,
    this.describe,
    this.name,
    this.email,
    this.time,
    this.msv,
  });

  factory NotificationModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return NotificationModel(
      name: data?['name'],
      email: data?['email'],
      title: data?['title'],
      msv: data?['msv'],
      describe: data?['describe'],
      time: (data?['time'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (title != null) "title": title,
      if (msv != null) "msv": msv,
      if (describe != null) "describe": describe,
      if (time != null) "time": Timestamp.fromDate(time!),
    };
  }
}
