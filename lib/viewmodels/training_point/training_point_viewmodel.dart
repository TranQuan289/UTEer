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
  Future<void> getTrainingPoint(String email) async {
    trainingPoint = await repository.getTrainingPoint(email);
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

  Future<void> updateDocument(
      {required String key,
      required var value,
      required String email,
      required String documentID}) {
    return firestore
        .collection('trainingPoints')
        .doc(documentID)
        .update(
          {key: value},
        )
        .then((value) => getTrainingPoint(email))
        .catchError((error) => print("Failed to update document: $error"));
  }
}

Future<void> addNotification({
  required String email,
}) async {
  final notificationRef = firestore.collection('notifications').doc();

  try {
    await notificationRef.set({
      'name': "name",
      'email': email,
      'title': "Thông báo về học bổng",
      'describe': "Điểm rèn luyện của bạn vừa được duyệt, vào lịch sử xem nhé",
      'type': "trainingPoint",
      'createAt': Timestamp.fromDate(DateTime.now()),
    });
  } catch (error) {
    print('Failed to add notification: $error');
  }
}
