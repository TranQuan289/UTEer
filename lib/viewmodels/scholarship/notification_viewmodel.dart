import 'package:uteer/models/notification_model.dart';
import 'package:uteer/models/user_model.dart';
import 'package:uteer/repository/notification_repository.dart';

import '../base_view_model.dart';

class NotificationViewModel extends BaseViewModel {
  final NotificationRepository repository;
  NotificationViewModel({required this.repository});
  List<NotificationModel> listNotification = [];
  UsersModel? usersModel;
  List<NotificationModel> get notificationModel => listNotification;
  Future<void> getNotification(String msv) async {
    listNotification = await repository.getNotification(msv);
    updateUI();
  }
}
