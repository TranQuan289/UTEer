import 'package:flutter/material.dart';
import 'package:uteer/models/user_model.dart';
import 'package:uteer/repository/auth_repository.dart';
import 'package:uteer/repository/user_repository.dart';
import 'package:uteer/res/enums/view_state.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

import '../../utils/routes/routes.dart';

class ProfileViewModel extends BaseViewModel {
  final UserRepository _userRepository;
  final AuthRepository _authRepository;
  late UserModel _user;
  ProfileViewModel({required UserRepository userRepository, required AuthRepository authRepository})
      : _userRepository = userRepository,
        _authRepository = authRepository;
  UserModel get user => _user;

  @override
  void onInitView(BuildContext context) {
    setState(ViewState.busy);
    super.onInitView(context);
    getProfile();
  }

  void getProfile() async {
    _user = await _userRepository.getProfile();
    setStateAndNotifier(ViewState.success);
  }

  void goToProfileDetailScreen() {
    Routes.goToProfileDetailScreen(context, {'user': _user});
  }

  void goToMyQrScreen() {
    Routes.goToMyQrScreen(context, {'user': _user});
  }

  void logout() async {
    await _authRepository.logOut().then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
      Routes.goToLoginScreen(context);
    });
  }
}
