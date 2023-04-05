import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uteer/models/provinces/district_model.dart';
import 'package:uteer/models/provinces/province_model.dart';
import 'package:uteer/models/provinces/ward_model.dart';
import 'package:uteer/models/user_model.dart';
import 'package:uteer/repository/province_repository.dart';
import 'package:uteer/repository/user_repository.dart';
import 'package:uteer/res/constant/app_assets.dart';
import 'package:uteer/res/enums/validate_state.dart';
import 'package:uteer/utils/constants.dart';
import 'package:uteer/utils/general_utils.dart';
import 'package:uteer/utils/log_utils.dart';
import 'package:uteer/utils/validators.dart';
import 'package:uteer/view/widgets/ui_outlined_button.dart';
import 'package:uteer/viewmodels/base_view_model.dart';

class ProfileDetailViewModel extends BaseViewModel {
  late final UserRepository _userRepository;
  late final UserModel _userModel;
  late final ProvinceRepository _provinceRepository;

  ProfileDetailViewModel(
      {required UserRepository userRepository,
      required UserModel userModel,
      required ProvinceRepository provinceRepository})
      : _userRepository = userRepository,
        _provinceRepository = provinceRepository,
        _userModel = userModel;
  UserModel get userModel => _userModel;

  String _city = Constants.EMPTY_STRING;
  String _district = Constants.EMPTY_STRING;
  String _ward = Constants.EMPTY_STRING;
  ValidateEmailState _validateEmailState = ValidateEmailState.none;
  ValidateEmailState get validateEmailState => _validateEmailState;

  ValidatePhoneState _validatePhoneState = ValidatePhoneState.none;
  ValidatePhoneState get validatePhoneState => _validatePhoneState;

  List<ProvinceModel> _provinces = [];
  List<String> get provinces =>
      _provinces.map((e) => e.name.replaceAll("Tỉnh", "").replaceAll("Thành phố", "")).toList();

  List<DistrictModel> _districts = [];
  List<String> get districts =>
      _districts.map((e) => e.name.replaceAll("Tỉnh", "").replaceAll("Thành phố", "")).toList();

  List<WardModel> _wards = [];
  List<String> get wards =>
      _wards.map((e) => e.name.replaceAll("Tỉnh", "").replaceAll("Thành phố", "")).toList();

  void fetchProvinces() async {
    try {
      _provinces = await _provinceRepository.getProvinces();
    } catch (e) {
      Utils.showToast(message: e.toString());
    }

    updateUI();
  }

  onEmailChanged(String? value) async {
    _userModel.email = value!;
    updateUI();
  }

  onPhoneChanged(String? value) async {
    _userModel.phone = value!;
    updateUI();
  }

  onCitizenIdChanged(String? value) async {
    _userModel.citizenId = value!;
    updateUI();
  }

  onCityChanged(String? value) async {
    _city = value!;
    _userModel.addressCity = _city;
    _districts = [];
    _wards = [];
    _userModel.addressWard = _city;

    final prov = _provinces.firstWhere((province) => province.name.contains(value));

    try {
      _districts = await _provinceRepository.getDistricts(prov.sId);
    } catch (e) {
      Utils.showToast(message: e.toString());
    }
    updateUI();
  }

  onDistrictChanged(String? value) async {
    _district = value!;
    _userModel.addressDistrict = _district;
    _wards = [];

    final prov = _provinces.firstWhere((province) => province.name.contains(_city));
    final dist = _districts.firstWhere((district) => district.name.contains(_district));

    try {
      _wards = await _provinceRepository.getWards(prov.sId, dist.code);
    } catch (e) {
      Utils.showToast(message: e.toString());
    }

    updateUI();
  }

  onWardChanged(String? value) {
    _ward = value!;
    _userModel.addressWard = _ward;
    updateUI();
  }

  void updateUserInformation() async {
    // if (!Validators.isValidCitizenId(_userModel.citizenId)) {
    //   _validateCitizenIdState = ValidateCitizenIdState.invalid;
    // } else {
    //   _validateCitizenIdState = ValidateCitizenIdState.none;
    // }
    if (!Validators.isEmail(_userModel.email)) {
      _validateEmailState = ValidateEmailState.invalid;
    } else {
      _validateEmailState = ValidateEmailState.none;
    }

    if (!Validators.isValidPhone(_userModel.phone)) {
      _validatePhoneState = ValidatePhoneState.invalid;
    } else {
      _validatePhoneState = ValidatePhoneState.none;
    }
    updateUI();

    //Utils.showProgressingDialog(context, message: "Loading...");
    try {
      LogUtils.d(_userModel.birthYear);
      await _userRepository.updateProfile(_userModel,
          avatar: _imageFile, isRemoveAvatar: _isRemoveAvatar);

      if (!context.mounted) return;
      // Utils.hideProgressDialog(context);

      Utils.showPopup(context,
          //  onTap: () => Navigator.pop(context),
          icon: AppAssets.icSuccess,
          title: 'Thành công',
          message: 'Cập nhật thông tin tài khoản thành công');
    } catch (e, s) {
      //Utils.hideProgressDialog(context);
      Utils.showPopup(context,
          // onTap: () => Navigator.pop(context),
          icon: AppAssets.icBack,
          title: 'Cập nhật không thành công',
          message: e.toString());
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }

  File? _imageFile;
  File? get avatarFile => _imageFile;
  final picker = ImagePicker();
  bool _isRemoveAvatar = false;
  Future pickImageFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery).onError((error, stackTrace) {
      Utils.showPopup(context,
          icon: AppAssets.icClose,
          title: 'Lỗi',
          message: 'Định dạng ảnh này không được hỗ trợ, vui lòng chọn ảnh khác!',
          action: Row(children: [
            Flexible(
                child: UIOutlineButton(
              title: 'OK',
              onPressed: () => Navigator.of(context).pop(),
            )),
          ]));
      return null;
    });
    _imageFile = File(pickedFile!.path);
    updateUI();
  }

  void clearAvatar() {
    _imageFile = null;
    _userModel.avatar = null;
    _isRemoveAvatar = true;
    updateUI();
  }
}
