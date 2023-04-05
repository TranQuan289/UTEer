import 'package:uteer/repository/notification_repository.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

import '../../models/notifications/notification.dart';

class NotificationViewModel extends BaseViewModel {
  final NotificationRepository _notificationRepository;

  String searchText = '';
  List<Notification>? _notifications;
  List<Notification>? get notifications {
    if (searchText.isNotEmpty) {
      return _notifications!
          .where((item) =>
              item.title.toLowerCase().contains(searchText.toLowerCase()) ||
              item.description.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
    return _notifications;
  }

  List<Notification> get newNotifications =>
      _notifications!.where((notification) => !notification.isRead).toList();
  NotificationViewModel({
    required NotificationRepository notificationRepository,
  }) : _notificationRepository = notificationRepository;

  void getNotifications() async {
    _notifications = await _notificationRepository.getNotifications();
    updateUI();
  }

  void onSearch(String? text) {
    searchText = text ?? '';
    updateUI();
  }

  void markRead(String id) {
    _notificationRepository.markRead(id);
  }

  void markAllRead() async {
    await _notificationRepository.markAllRead();
    getNotifications();
  }
}
