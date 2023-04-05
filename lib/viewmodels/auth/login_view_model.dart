import 'package:flutter/material.dart';
import 'package:uteer/data/remote/api_exception.dart';
import 'package:uteer/models/auth_model.dart';
import 'package:uteer/repository/auth_repository.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/res/enums/validate_state.dart';
import 'package:uteer/res/enums/view_state.dart';
import 'package:uteer/services/shared_pref_service.dart';
import 'package:uteer/utils/constants.dart';
import 'package:uteer/utils/general_utils.dart';
import 'package:uteer/utils/log_utils.dart';
import 'package:uteer/utils/routes/routes.dart';
import 'package:uteer/utils/string_utils.dart';
import 'package:uteer/utils/validators.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  final AuthRepository authRepository;
  LoginViewModel({required this.authRepository});

  bool _securePassword = true;

  bool get securePassword => _securePassword;

  void obscurePassword(bool value) {
    _securePassword = value;
    setState(ViewState.success);
  }

  String _email = Constants.EMPTY_STRING;

  void onEmailChange(String value) {
    _email = value.trim();
    setState(ViewState.success);
  }

  String _password = Constants.EMPTY_STRING;

  void onPasswordChange(String value) {
    _password = value.trim();
    setState(ViewState.success);
  }

  bool get isLoginButtonEnabled {
    return !Validators.isEmpty(_password) && !Validators.isEmpty(_email);
  }

  ValidateEmailState _validateEmailState = ValidateEmailState.none;

  ValidateEmailState get validateEmailState => _validateEmailState;

  void restoreValidateEmailState() {
    _validateEmailState = ValidateEmailState.none;
    setState(ViewState.success);
  }

  ValidatePasswordState _validatePasswordState = ValidatePasswordState.none;

  ValidatePasswordState get validatePasswordState => _validatePasswordState;

  void restoreValidatePasswordState() {
    _validatePasswordState = ValidatePasswordState.none;
    updateUI();
  }

  void onLoginBtnPressed() async {
    if (!Validators.isValidPassword(_password)) {
      _validatePasswordState = ValidatePasswordState.invalid;
      updateUI();
      return;
    }

    Utils.showProgressingDialog(context, message: "Loading...");

    try {
      final AuthModel resp =
          await authRepository.login(username: _email.trim(), password: _password.trim());

      LogUtils.d("${resp.accessToken} \n ${resp.refreshToken}");
      await Future.wait([
        SharedPrefService.instance.setUserToken(userToken: resp.accessToken),
        SharedPrefService.instance.setUserRefreshToken(userRefreshToken: resp.refreshToken),
      ]);

      Utils.hideProgressDialog(context);

      goToHomeScreen();
    } on BadRequestException catch (e) {
      Utils.showToast(message: StringUtils.getErrorMessage(context: context, message: e.message!));
    } on NotFoundException catch (e) {
      LogUtils.d(e.message!);
      Utils.hideProgressDialog(context);

      String title = '';
      String message = '';
      switch (e.message) {
        case 'UserNotVerify':
          title = "Tài khoản chưa xác thực";
          message =
              "Tài khoản của bạn chưa được xác thực.\nHãy kiểm tra email để xác thực tài khoản!";
          break;
        default:
          title = "Tài khoản không tồn tại";
          message = "Tài khoản của bạn không tồn tại.\nHãy kiểm tra lại!";
          break;
      }

      Utils.showPopup(
        onTap: () => Navigator.pop(context),
        context,
        icon: AppAssets.icClose,
        title: title,
        message: message,
      );
    } on UnauthorizedException {
      LogUtils.d("NotFoundException");
      Utils.hideProgressDialog(context);
      Utils.showPopup(
        onTap: () => Navigator.pop(context),
        context,
        icon: AppAssets.icClose,
        title: "Đăng nhập thất bại",
        message: "Mật khẩu của bạn không đúng.\nHãy kiểm tra lại!",
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

  void goToForgotPasswordScreen() {
    Routes.goToForgotPasswordScreen(context);
  }

  void goToRegisterScreen() {
    Routes.goToRegisterScreen(context);
  }

  void goToHomeScreen() {
    Routes.goToHomeScreen(context);
  }
}
