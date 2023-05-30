import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uteer/models/open_training_point_model.dart';
import 'package:uteer/models/training_point_model.dart';
import 'package:uteer/models/user_model.dart';
import 'package:uteer/repository/training_point_repository.dart';

import '../base_view_model.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class TrainingPointViewModel extends BaseViewModel {
  final TrainingPointRepository repository;
  TrainingPointViewModel({required this.repository});
  TrainingPointModel? trainingPoint;
  List<TrainingPointModel?>? listTrainingPoint;
  OpenTrainingPointModel? openTrainingPoint;
  UsersModel? user;
  TrainingPointModel? get trainingPointModel => trainingPoint;
  List<TrainingPointModel?>? get listTrainingPointModel => listTrainingPoint;
  UsersModel? get usersModel => user;
  OpenTrainingPointModel? get openTrainingPointModel => openTrainingPoint;
  Future<void> getTrainingPoint(String msv) async {
    trainingPoint = await repository.getTrainingPoint(msv);
    updateUI();
  }

  Future<void> getListTrainingPoint() async {
    listTrainingPoint = await repository.getListTrainingPoints();
    updateUI();
  }

  Future<void> getOpenTrainingPoint() async {
    openTrainingPoint = await repository.getOpenTrainingPoint();
    updateUI();
  }

  Future<UsersModel?> getUser(String email) async {
    user = await repository.getUser(email);
    return user;
  }

  Future<void> updateDocument({required String key, required var value, required String msv}) {
    return firestore
        .collection('trainingPoints')
        .doc('48gGTkgc7VXhJ0xeTNov')
        .update(
          {key: value},
        )
        .then((value) => getTrainingPoint(msv))
        .catchError((error) => print("Failed to update document: $error"));
  }
}
