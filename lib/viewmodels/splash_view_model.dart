import 'package:flutter/material.dart';
import 'package:uteer/repository/auth_repository.dart';
import 'package:uteer/services/shared_pref_service.dart';
import 'package:uteer/utils/routes/routes.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  final AuthRepository authRepository;

  SplashViewModel({
    required this.authRepository,
  });

  @override
  void onInitView(BuildContext context) {
    super.onInitView(context);
    _initialLaunchApp();
  }

  Future<void> _initialLaunchApp() async {
    await _initData();

    authRepository.isUserLoggedIn().then((isLoggedIn) async {
      Future.delayed(const Duration(seconds: 3));
      if (isLoggedIn) {
        _goToHomeScreen();
      } else {
        _goToLoginScreen();
      }
    });
  }

  Future<void> _initData() async {
    await Future.wait([
      //--- SharedPref --//
      SharedPrefService.instance.onInit(),
    ]);
  }

  // Future<void> _getUserData() async {
  //   final profile = await userRepository.getProfile();
  //   LogUtils.d("User Profile: ${json.encode(profile.toJson())}");
  // }

  void _goToHomeScreen() {
    Routes.goToHomeScreen(context);
  }

  void _goToLoginScreen() {
    Routes.goToLoginScreen(context);
  }
}
