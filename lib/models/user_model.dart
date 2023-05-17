import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String? name;
  final String? email;
  final String? role;
  final String? msv;

  final String? major;
  final String? department;

  Users({this.major, this.department, this.name, this.email, this.role, this.msv});

  factory Users.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Users(
      name: data?['name'],
      email: data?['email'],
      role: data?['role'],
      msv: data?['msv'],
      major: data?['major'],
      department: data?['department'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (email != null) "email": email,
      if (role != null) "role": role,
      if (msv != null) "msv": msv,
      if (major != null) "major": major,
      if (department != null) "msv": department,
    };
  }
}
