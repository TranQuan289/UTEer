import 'package:uteer/repository/auth_repository.dart';
import 'package:uteer/res/enums/validate_state.dart';
import 'package:uteer/utils/constants.dart';
import 'package:uteer/utils/general_utils.dart';
import 'package:uteer/utils/log_utils.dart';
import 'package:uteer/utils/routes/routes.dart';
import 'package:uteer/utils/string_utils.dart';
import 'package:uteer/utils/validators.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

class RegisterViewModel extends BaseViewModel {
  final AuthRepository authRepository;
  RegisterViewModel({required this.authRepository});

  bool _isSecurePassword = true;
  bool get isSecurePassword => _isSecurePassword;

  String _username = Constants.EMPTY_STRING;
  String _fullname = Constants.EMPTY_STRING;
  String _citizenId = Constants.EMPTY_STRING;
  String _email = Constants.EMPTY_STRING;
  String _phoneNumber = Constants.EMPTY_STRING;
  String _bloodType = Constants.EMPTY_STRING;
  String _password = Constants.EMPTY_STRING;
  String _passwordConfirm = Constants.EMPTY_STRING;

  bool get isRegisterButtonEnabled {
    return !Validators.isEmpty(_fullname) &&
        // !Validators.isEmpty(_username) &&
        !Validators.isEmpty(_citizenId) &&
        !Validators.isEmpty(_email) &&
        !Validators.isEmpty(_phoneNumber) &&
        !Validators.isEmpty(_password) &&
        !Validators.isEmpty(_passwordConfirm);
    // _validateEmailState == ValidateEmailState.none &&
    // _validatePhoneState == ValidatePhoneState.none &&
    // _validatePasswordState == ValidatePasswordState.none &&
    // _validatePasswordConfirmState == ValidatePasswordState.none;
  }

  ValidateEmailState _validateEmailState = ValidateEmailState.none;
  ValidateEmailState get validateEmailState => _validateEmailState;

  ValidatePhoneState _validatePhoneState = ValidatePhoneState.none;
  ValidatePhoneState get validatePhoneState => _validatePhoneState;

  final ValidateBloodState _validateBloodState = ValidateBloodState.none;
  ValidateBloodState get validateBloodState => _validateBloodState;
  final ValidateCitizenIdState _validateCitizenIdState = ValidateCitizenIdState.none;
  ValidateCitizenIdState get validateCitizenIdState => _validateCitizenIdState;

  ValidatePasswordState _validatePasswordState = ValidatePasswordState.none;
  ValidatePasswordState get validatePasswordState => _validatePasswordState;

  ValidatePasswordState _validatePasswordConfirmState = ValidatePasswordState.none;
  ValidatePasswordState get validatePasswordConfirmState => _validatePasswordConfirmState;

  void onUsernameChange(String value) {
    _username = value.trim();
    updateUI();
  }

  void onNameChange(String value) {
    _fullname = value.trim();
    updateUI();
  }

  void onCitizenIdChange(String value) {
    _citizenId = value.trim();
    updateUI();
  }

  void onEmailChange(String value) {
    _email = value.trim();

    updateUI();
  }

  void onPhoneChange(String value) {
    _phoneNumber = value.trim();

    updateUI();
  }

  void onBloodTypeChange(String? value) {
    if (value != null) {
      _bloodType = value.trim();
    }
    updateUI();
  }

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

  void registerNewAccount() async {
    // if (!Validators.isValidCitizenId(_citizenId)) {
    //   _validateCitizenIdState = ValidateCitizenIdState.invalid;
    // } else {
    //   _validateCitizenIdState = ValidateCitizenIdState.none;
    // }

    if (!Validators.isEmail(_email)) {
      _validateEmailState = ValidateEmailState.invalid;
    } else {
      _validateEmailState = ValidateEmailState.none;
    }
    if (!Validators.isValidPhone(_phoneNumber)) {
      _validatePhoneState = ValidatePhoneState.invalid;
    } else {
      _validatePhoneState = ValidatePhoneState.none;
    }
    updateUI();
    LogUtils.d(
        "$_username - $_email - $_password - $_fullname - $_phoneNumber - $_bloodType = $_citizenId - $_password");

    Utils.showProgressingDialog(context, message: "Loading...");
    try {
      final resp = await authRepository.register(
        username: _username,
        email: _email,
        fullname: _fullname,
        phone: _phoneNumber,
        citizenId: _citizenId,
        bloodGroup: _bloodType.toString(),
        password: _password,
      );

      LogUtils.d(resp.toString());

      Utils.hideProgressDialog(context);

      goToVerifyMailScreen();
    } catch (e) {
      Utils.hideProgressDialog(context);
      String errorMessage = StringUtils.getErrorMessage(
        context: context,
        message: e is List ? e[0].toString() : e.toString(),
      );
      Utils.showToast(message: errorMessage);
    }
  }

  void goToVerifyMailScreen() {
    Routes.goToVerifyMailScreen(context);
  }
}
