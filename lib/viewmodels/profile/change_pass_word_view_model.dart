import 'package:uteer/repository/user_repository.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/res/enums/validate_state.dart';
import 'package:uteer/res/enums/view_state.dart';
import 'package:uteer/utils/constants.dart';
import 'package:uteer/utils/general_utils.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

class ChangePasswordViewModel extends BaseViewModel {
  late final UserRepository _userRepository;
  ChangePasswordViewModel({required UserRepository userRepository})
      : _userRepository = userRepository;
  bool _securePassword = true;
  bool _secureNewPassword = true;
  bool _secureReEnterPassword = true;
  bool get securePassword => _securePassword;
  bool get secureNewPassword => _secureNewPassword;
  bool get secureReEnterPassword => _secureReEnterPassword;
  ValidatePasswordState _validatePasswordState = ValidatePasswordState.none;
  ValidatePasswordState _validateNewPasswordState = ValidatePasswordState.none;
  ValidatePasswordState get validatePasswordState => _validatePasswordState;
  ValidatePasswordState get validateNewPasswordState => _validateNewPasswordState;
  String _password = Constants.EMPTY_STRING;
  String _newPassword = Constants.EMPTY_STRING;
  String _reEnterPassword = Constants.EMPTY_STRING;
  void onPasswordChange(String value) {
    _password = value.trim();
    setState(ViewState.success);
  }

  void onNewPasswordChange(String value) {
    _newPassword = value.trim();
    setState(ViewState.success);
  }

  void onReEnterPasswordChange(String value) {
    _reEnterPassword = value.trim();
    setState(ViewState.success);
  }

  void restoreValidatePasswordState() {
    _validatePasswordState = ValidatePasswordState.none;
    updateUI();
  }

  void obscurePassword(bool value) {
    _securePassword = value;
    setState(ViewState.success);
  }

  void obscureNewPassword(bool value) {
    _secureNewPassword = value;
    setState(ViewState.success);
  }

  void obscureReEnterPassword(bool value) {
    _secureReEnterPassword = value;
    setState(ViewState.success);
  }

  void updatePassword() async {
    restoreValidatePasswordState();
    // Check if password is empty
    if (_password.isEmpty) {
      _validatePasswordState = ValidatePasswordState.invalid;
      updateUI();
      return;
    } else if (_newPassword.isEmpty) {
      _validateNewPasswordState = ValidatePasswordState.invalid;
      updateUI();
      return;
    }
    // Check if new password is matched
    if (_newPassword != _reEnterPassword) {
      //_validateNewPasswordState = ValidatePasswordState.notMatched;
      updateUI();
      return;
    }
    if (_password == _newPassword) {
      //_validateNewPasswordState = ValidatePasswordState.notNewPassword;
      updateUI();
      return;
    }
    _userRepository.updatePassword(_password, _newPassword).then((value) {
      Utils.showPopup(context,
          //onTap: () => Navigator.pop(context),
          icon: AppAssets.icSuccess,
          title: 'Thành công',
          message: 'Mật khẩu của bạn đã được thay đổi!');
    }).onError((error, stackTrace) {
      print(error);
      Utils.showPopup(context,
          //onTap: () => Navigator.pop(context),
          icon: AppAssets.icRefuse,
          title: 'Lỗi',
          message: error.toString());
    });
  }
}
