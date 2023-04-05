import 'package:flutter/material.dart';
import 'package:uteer/models/user_model.dart';
import 'package:uteer/repository/user_repository.dart';
import 'package:uteer/res/enums/view_state.dart';
import 'package:uteer/utils/routes/routes.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

class HomeScreenViewModel extends BaseViewModel {
  UserRepository userRepository;

  late UserModel _userModel;
  UserModel get userModel => _userModel;

  HomeScreenViewModel({required this.userRepository});

  @override
  void onInitView(BuildContext context) {
    setState(ViewState.busy);
    super.onInitView(context);
  }

  Future<void> fetchData() async {
    _userModel = await userRepository.getProfile();
    setState(ViewState.success);
  }

  void goToProfileDetailScreen() {
    Routes.goToProfileDetailScreen(context, {'user': _userModel});
  }
}
