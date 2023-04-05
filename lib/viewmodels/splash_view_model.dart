import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uteer/repository/auth_repository.dart';
import 'package:uteer/repository/province_repository.dart';
import 'package:uteer/repository/user_repository.dart';
import 'package:uteer/services/shared_pref_service.dart';
import 'package:uteer/utils/log_utils.dart';
import 'package:uteer/utils/routes/routes.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  final ProvinceRepository provinceRepository;

  SplashViewModel(
      {required this.authRepository,
      required this.userRepository,
      required this.provinceRepository});

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
        await _getUserData();
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

    await provinceRepository.getProvinces();
  }

  Future<void> _getUserData() async {
    final profile = await userRepository.getProfile();
    LogUtils.d("User Profile: ${json.encode(profile.toJson())}");
  }

  void _goToHomeScreen() {
    Routes.goToHomeScreen(context);
  }

  void _goToLoginScreen() {
    Routes.goToLoginScreen(context);
  }
}
