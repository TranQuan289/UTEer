import 'dart:io';

import 'package:dio/dio.dart';
import 'package:uteer/data/remote/api_endpoint.dart';
import 'package:uteer/models/user_model.dart';
import 'package:uteer/services/network_api_service.dart';
import 'package:uteer/utils/log_utils.dart';

abstract class UserRepository {
  UserModel? _profile;

  Future<UserModel> getProfile();
  Future<UserModel> getUserById(String id);
  Future<dynamic> updateProfile(UserModel user, {File? avatar, bool isRemoveAvatar = false});
  Future<dynamic> updatePassword(String oldPassword, String newPassword);
  Future<dynamic> requestDeleteAccount();
  Future<dynamic> deleteAccount(String reason, String otp);
}

class UserRepositoryImpl extends UserRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  @override
  Future<UserModel> getProfile() async {
    try {
      if (_profile == null) {
        dynamic response = await _apiServices.get(url: ApiEndPoint.getProfile);
        _profile = UserModel.fromJson(response);
      }

      return _profile!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateProfile(UserModel user, {File? avatar, bool isRemoveAvatar = false}) async {
    await _apiServices.put(url: ApiEndPoint.updateProfile(user.id), data: user.toJson());
    // upload file to server
    if (avatar != null) {
      String filename = avatar.path.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(avatar.path, filename: filename),
      });

      LogUtils.d(filename);
      await _apiServices.post(url: ApiEndPoint.updateUserAvatar(user.id), data: formData);
    } else if (isRemoveAvatar) {
      await _apiServices.delete(url: ApiEndPoint.deleteUserAvatar(user.id));
    }
  }

  @override
  Future updatePassword(String oldPassword, String newPassword) async {
    try {
      if (_profile == null) {
        await getProfile();
      }
      var response = await _apiServices.post(
          url: ApiEndPoint.updatePassword(_profile!.id),
          data: {"currentPassword": oldPassword, "newPassword": newPassword});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUserById(String id) async {
    var response = await _apiServices.get(url: ApiEndPoint.getProfileById(id));
    return UserModel.fromJson(response);
  }

  @override
  Future deleteAccount(String reason, String otp) async {
    try {
      if (_profile == null) {
        await getProfile();
      }

      var response = await _apiServices.post(
          url: ApiEndPoint.deleteAccount(_profile!.id), data: {"reason": reason, "code": otp});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future requestDeleteAccount() async {
    try {
      if (_profile == null) {
        await getProfile();
      }

      var response =
          await _apiServices.post(url: ApiEndPoint.requestDeleteAccount(_profile!.id), data: {});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
