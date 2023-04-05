import 'package:uteer/repository/auth_repository.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/res/enums/validate_state.dart';
import 'package:uteer/res/style/app_colors.dart';
import 'package:uteer/utils/constants.dart';
import 'package:uteer/utils/general_utils.dart';
import 'package:uteer/utils/log_utils.dart';
import 'package:uteer/utils/routes/routes.dart';
import 'package:uteer/utils/string_utils.dart';
import 'package:uteer/utils/validators.dart';
import 'package:uteer/view/widgets/ui_outlined_button.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

class CreatePasswordViewModel extends BaseViewModel {
  AuthRepository authRepository;
  final String otp;
  final String email;
  CreatePasswordViewModel({required this.otp, required this.email, required this.authRepository});

  String _password = Constants.EMPTY_STRING;
  String _passwordConfirm = Constants.EMPTY_STRING;

  bool _isSecurePassword = true;
  bool get isSecurePassword => _isSecurePassword;

  ValidatePasswordState _validatePasswordState = ValidatePasswordState.none;
  ValidatePasswordState get validatePasswordState => _validatePasswordState;

  ValidatePasswordState _validatePasswordConfirmState = ValidatePasswordState.none;
  ValidatePasswordState get validatePasswordConfirmState => _validatePasswordConfirmState;

  void onPasswordChange(String value) {
    _password = value.trim();
    if (!Validators.isValidPassword(_password)) {
      _validatePasswordState = ValidatePasswordState.invalid;
    } else {
      _validatePasswordState = ValidatePasswordState.none;
    }
    updateUI();
  }

  void onPasswordConfirmChange(String value) {
    _passwordConfirm = value.trim();
    if (!Validators.isValidPassword(_passwordConfirm)) {
      _validatePasswordConfirmState = ValidatePasswordState.invalid;
    } else if (_passwordConfirm != _password) {
      _validatePasswordConfirmState = ValidatePasswordState.notMatched;
    } else {
      _validatePasswordConfirmState = ValidatePasswordState.none;
    }

    updateUI();
  }

  void toggleShowHidePassword() {
    _isSecurePassword = !_isSecurePassword;
    updateUI();
  }

  void onCreatePasswordPressed() async {
    if (_validatePasswordConfirmState != ValidatePasswordState.none ||
        _validatePasswordState != ValidatePasswordState.none) {
      return;
    }

    try {
      Utils.showProgressingDialog(context, message: "Loading...");

      await authRepository.resetPassword(
        code: otp,
        email: email,
        password: _password,
      );

      _showAlert();
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

  _showAlert() {
    Utils.showPopup(
      context,
      icon: AppAssets.icSuccess,
      title: "Đổi mật khẩu thành công",
      message: "Bạn đã đổi mật khẩu thành công, nhấn vào nút để quay lại đăng nhập",
      action: UIOutlineButton(
        title: "Quay lại đăng nhập",
        backgroundColor: AppColors.primaryColor,
        onPressed: goToLoginScreen,
      ),
    );
  }

  goToLoginScreen() {
    Routes.goToLoginScreen(context);
  }
}
