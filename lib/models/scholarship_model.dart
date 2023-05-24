import 'package:cloud_firestore/cloud_firestore.dart';

class ScholarshipModel {
  final String documentId;
  final String? name;
  final String? msv;
  final String? classRoom;
  final String? rank;
  final String? bonus;

  ScholarshipModel(
      {required this.documentId, this.classRoom, this.rank, this.bonus, this.name, this.msv});

  factory ScholarshipModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ScholarshipModel(
      documentId: snapshot.id, // Gán Document ID vào trường documentId
      name: data?['name'] ?? '', // Kiểm tra và gán giá trị mặc định là chuỗi rỗng nếu null
      classRoom: data?['classRoom'] ?? '',
      rank: data?['rank'] ?? '',
      msv: data?['msv'] ?? '',
      bonus: data?['bonus'] ?? '',
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (documentId != null) "Document ID": documentId,
      if (name != null) "name": name,
      if (classRoom != null) "email": classRoom,
      if (rank != null) "role": rank,
      if (msv != null) "msv": msv,
      if (bonus != null) "major": bonus,
    };
  }
}
