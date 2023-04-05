import 'package:get_it/get_it.dart';
import 'package:uteer/repository/auth_repository.dart';
import 'package:uteer/repository/notification_repository.dart';
import 'package:uteer/repository/province_repository.dart';
import 'package:uteer/repository/user_repository.dart';

final GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerFactory<AuthRepository>(() => AuthRepositoryImpl());
  locator.registerFactory<UserRepository>(() => UserRepositoryImpl());

  locator.registerFactory<ProvinceRepository>(() => ProvinceRepositoryImpl());
  locator.registerFactory<NotificationRepository>(() => NotificationRepositoryImpl());
}
