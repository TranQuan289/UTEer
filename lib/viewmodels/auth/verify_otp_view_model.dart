import 'package:uteer/repository/auth_repository.dart';
import 'package:uteer/utils/constants.dart';
import 'package:uteer/utils/general_utils.dart';
import 'package:uteer/utils/log_utils.dart';
import 'package:uteer/utils/routes/routes.dart';
import 'package:uteer/utils/string_utils.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

class VerifyOtpViewModel extends BaseViewModel {
  AuthRepository authRepository;
  final String? email;
  String? _otp;

  VerifyOtpViewModel(this.email, {required this.authRepository});

  onOtpChanged(String? code) {
    _otp = code;
    updateUI();
  }

  onOtpCompleted(String? code) {
    _otp = code;
    onVerifyButtonPressed();
  }

  void onResendOtp() async {
    Utils.showProgressingDialog(context, message: "Loading...");

    try {
      final resp = await authRepository.forgotPassword(email: email!);
      LogUtils.d(resp.toString());
      Utils.hideProgressDialog(context);

      Utils.showToast(message: "Mã OTP đã được gửi vào email của bạn!");
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

  void onVerifyButtonPressed() async {
    LogUtils.d("OTP code: $_otp - $email - ${Constants.RESET_PASSWORD_STRING}");
    goToCreatePasswordScreen();
  }

  void goToCreatePasswordScreen() {
    Routes.goToCreatePasswordScreen(context, arguments: {"email": email, "otp": _otp});
  }
}
