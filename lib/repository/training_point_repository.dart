import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uteer/models/open_training_point_model.dart';
import 'package:uteer/models/training_point_model.dart';
import 'package:uteer/models/user_model.dart';

class TrainingPointRepository {
  Future<TrainingPointModel?> getTrainingPoint(String email, String semester) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String, dynamic>> querySnapshot = await db
        .collection('trainingPoints')
        .where('email', isEqualTo: email)
        .where('semester', isEqualTo: semester) // Thêm điều kiện lọc theo semester
        .get();

    final List<DocumentSnapshot<Map<String, dynamic>>> documents = querySnapshot.docs;
    if (documents.isNotEmpty) {
      final DocumentSnapshot<Map<String, dynamic>> document = documents.first;
      final TrainingPointModel trainingPoint = TrainingPointModel.fromFirestore(document, null);
      return trainingPoint;
    } else {
      print('No training point');
      return null;
    }
  }

  Future<List<TrainingPointModel>> getTrainingPointAll(String email) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection('trainingPoints').where('email', isEqualTo: email).get();

    final List<DocumentSnapshot<Map<String, dynamic>>> documents = querySnapshot.docs;
    final List<TrainingPointModel> trainingPoints = [];

    for (var document in documents) {
      final TrainingPointModel trainingPoint = TrainingPointModel.fromFirestore(document, null);
      trainingPoints.add(trainingPoint);
    }

    return trainingPoints;
  }

  Future<OpenTrainingPointModel?> getOpenTrainingPoint() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection('openTrainingPoints').get();

    final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents = querySnapshot.docs;
    if (documents.isNotEmpty) {
      final QueryDocumentSnapshot<Map<String, dynamic>> document = documents.first;
      final OpenTrainingPointModel openTrainingPointModel =
          OpenTrainingPointModel.fromFirestore(document, null);
      return openTrainingPointModel;
    } else {
      print('No open training point');
      return null;
    }
  }

  Future<UsersModel?> getUser(String email) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection('users').where('email', isEqualTo: email).get();
    final List<DocumentSnapshot<Map<String, dynamic>>> documents = querySnapshot.docs;
    if (documents.isNotEmpty) {
      final UsersModel user = UsersModel.fromFirestore(documents.first, null);
      return user;
    } else {
      print('No user found with email: $email');
      return null;
    }
  }

  Future<List<TrainingPointModel>> getListTrainingPoints() async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await db.collection('trainingPoints').where('semester', isEqualTo: "222").get();

    final List<DocumentSnapshot<Map<String, dynamic>>> documents = querySnapshot.docs;
    final List<TrainingPointModel> trainingPoints = [];

    for (var document in documents) {
      final TrainingPointModel trainingPoint = TrainingPointModel.fromFirestore(document, null);
      trainingPoints.add(trainingPoint);
    }

    if (trainingPoints.isNotEmpty) {
      return trainingPoints;
    } else {
      print('No training points');
      return [];
    }
  }
}

Future<List<TrainingPointModel>> searchTrainingPointByName(String name) async {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await db.collection('trainingPoints').where('name', isEqualTo: name).get();

  final List<DocumentSnapshot<Map<String, dynamic>>> documents = querySnapshot.docs;
  final List<TrainingPointModel> trainingPoints = [];

  for (var document in documents) {
    final TrainingPointModel trainingPoint = TrainingPointModel.fromFirestore(document, null);
    trainingPoints.add(trainingPoint);
  }

  if (trainingPoints.isNotEmpty) {
    return trainingPoints;
  } else {
    print('No training points found with name: $name');
    return [];
  }
}
