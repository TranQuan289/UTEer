import 'package:cloud_firestore/cloud_firestore.dart';

class UsersModel {
  final String? name;
  final String? email;
  final String? rule;
  final String? msv;
  final String? major;
  final String? department;
  final String? classRoom;
  final String? phone;

  UsersModel(
      {this.classRoom,
      this.phone,
      this.major,
      this.department,
      this.name,
      this.email,
      this.rule,
      this.msv});

  factory UsersModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UsersModel(
      name: data?['name'],
      email: data?['email'],
      rule: data?['rule'],
      msv: data?['msv'],
      major: data?['major'],
      department: data?['department'],
      classRoom: data?['classRoom'],
      phone: data?['phone'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (rule != null) "rule": rule,
      if (msv != null) "msv": msv,
      if (major != null) "major": major,
      if (department != null) "department": department,
      if (classRoom != null) "classRoom": classRoom,
      if (phone != null) "phone": phone,
    };
  }
}
