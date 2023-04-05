import 'package:uteer/models/notifications/notification.dart';
import 'package:uteer/repository/notification_repository.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

class NotificationDetailsViewModel extends BaseViewModel {
  final NotificationRepository _notificationRepository;
  late final Notification _notification;
  NotificationDetailsViewModel(
      {required NotificationRepository notificationRepository, required Notification notification})
      : _notificationRepository = notificationRepository,
        _notification = notification;

  void getNotificationDetails() {
    _notificationRepository.getNotificationDetails(_notification.id);
  }
}
