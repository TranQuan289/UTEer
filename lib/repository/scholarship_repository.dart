import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uteer/models/scholarship_model.dart';

import '../services/network_api_service.dart';

class ScholarshipRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<List<ScholarshipModel>> getScholarship() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection('scholarship').get();
    final List<DocumentSnapshot<Map<String, dynamic>>> documents = querySnapshot.docs;
    if (documents.isNotEmpty) {
      final List<ScholarshipModel> scholarships = documents.map((doc) {
        return ScholarshipModel.fromFirestore(doc, null);
      }).toList();
      return scholarships;
    } else {
      print('No scholarships');
      return [];
    }
  }
}