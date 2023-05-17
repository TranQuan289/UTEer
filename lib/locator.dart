import 'package:get_it/get_it.dart';
import 'package:uteer/repository/auth_repository.dart';

final GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerFactory<AuthRepository>(() => AuthRepositoryImpl());
}
