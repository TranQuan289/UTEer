import 'package:flutter/material.dart';
import 'package:uteer/data/remote/api_exception.dart';
import 'package:uteer/repository/auth_repository.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/res/enums/validate_state.dart';
import 'package:uteer/res/enums/view_state.dart';
import 'package:uteer/utils/constants.dart';
import 'package:uteer/utils/general_utils.dart';
import 'package:uteer/utils/log_utils.dart';
import 'package:uteer/utils/routes/routes.dart';
import 'package:uteer/utils/string_utils.dart';
import 'package:uteer/utils/validators.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  AuthRepository authRepository;

  ForgotPasswordViewModel({required this.authRepository});

  // error message email field
  ValidateEmailState _emailState = ValidateEmailState.none;
  ValidateEmailState get emailState => _emailState;

  String _email = Constants.EMPTY_STRING;

  void onEmailChange(String value) {
    _email = value.trim();
    updateUI();
  }

  void sendResetPasswordRequest() async {
    // invalid email
    if (!Validators.isEmail(_email)) {
      _emailState = ValidateEmailState.invalid;
      setState(ViewState.success);
      return;
    }

    Utils.showProgressingDialog(context, message: "Loading...");

    try {
      final resp = await authRepository.forgotPassword(email: _email);
      LogUtils.d(resp.toString());
      Utils.hideProgressDialog(context);

      goToVerifyOTPScreen();
    } on NotFoundException {
      Utils.hideProgressDialog(context);
      Utils.showPopup(
        onTap: () => Navigator.pop(context),
        context,
        icon: AppAssets.icClose,
        title: "Tài khoản không tồn tại",
        message: "Tài khoản của bạn không tồn tại.\nHãy kiểm tra lại!",
      );
    } catch (e) {
      LogUtils.d(e.toString());
      Utils.hideProgressDialog(context);

      String errorMessage = StringUtils.getErrorMessage(
        context: context,
        message: e is List ? e[0].toString() : e.toString(),
      );

      Utils.showToast(message: errorMessage);
    }
  }

  void onFocusEmail() {
    _emailState = ValidateEmailState.none;
    setState(ViewState.success);
  }

  void goToSignInScreen() {
    Routes.goToHomeScreen(context);
  }

  void goToVerifyOTPScreen() {
    Routes.goToVerifyOtpScreen(context, arguments: {"email": _email});
  }
}
