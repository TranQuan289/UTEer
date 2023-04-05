import 'package:uteer/data/remote/api_endpoint.dart';
import 'package:uteer/services/network_api_service.dart';

import '../models/notifications/notification.dart';

abstract class NotificationRepository {
  Future<List<Notification>> getNotifications();
  Future markAllRead();
  Future markRead(String id);
  Future getNotificationDetails(String id);
}

class NotificationRepositoryImpl extends NotificationRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  @override
  Future<List<Notification>> getNotifications() async {
    var response = await _apiServices.get(url: ApiEndPoint.notifications);
    List<Notification> notifications = (response['data'] as List)
        .map<Notification>((json) => Notification.fromJson(json))
        .toList();
    return notifications;
  }

  @override
  Future markAllRead() async {
    await _apiServices.put(url: ApiEndPoint.readAllNotifications);
  }

  @override
  Future getNotificationDetails(String id) async {
    // var response =
    await _apiServices.get(url: ApiEndPoint.getNotificationDetails(id));
    // print(response['description']);
  }

  @override
  Future markRead(String id) async {
    try {
      await _apiServices.put(url: ApiEndPoint.getNotificationDetails(id), data: {
        "isRead": true,
      });
    } catch (e) {
      rethrow;
    }
  }
}
