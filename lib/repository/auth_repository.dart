import 'package:uteer/data/remote/api_endpoint.dart';
import 'package:uteer/models/auth_model.dart';
import 'package:uteer/services/network_api_service.dart';
import 'package:uteer/services/shared_pref_service.dart';
import 'package:uteer/utils/log_utils.dart';

abstract class AuthRepository {
  Future<AuthModel> login({required String username, required String password});
  Future<dynamic> register({
    required String username,
    required String fullname,
    required String email,
    required String password,
    required String phone,
    required String citizenId,
    required String bloodGroup,
  });
  Future<dynamic> refreshToken({
    required String accessToken,
    required String refreshToken,
  });

  Future<dynamic> forgotPassword({
    required String email,
  });

  Future<AuthModel> resetPassword({
    required String email,
    required String code,
    required String password,
  });

  Future<bool> isUserLoggedIn() async {
    try {
      if (SharedPrefService.instance.userToken == null ||
          SharedPrefService.instance.userToken!.isEmpty) {
        LogUtils.d("No login token found!");

        return false;
      }

      /// get new token
      final AuthModel response = await refreshToken(
        accessToken: SharedPrefService.instance.userToken!,
        refreshToken: SharedPrefService.instance.userRefreshToken!,
      );

      LogUtils.d("new token: ${response.accessToken}");
      await saveLoginToken(response);
      return true;
    } catch (e) {
      LogUtils.d("renewal failed!");
      return false;
    }
  }

  Future<void> saveLoginToken(AuthModel authToken) async {
    await SharedPrefService.instance.setUserToken(userToken: authToken.accessToken);
    await SharedPrefService.instance.setUserRefreshToken(userRefreshToken: authToken.refreshToken);
  }

  Future<void> logOut();
}

class AuthRepositoryImpl extends AuthRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  @override
  Future<AuthModel> login({required String username, required String password}) async {
    Map<String, String> data = {
      "username": username,
      "password": password,
    };

    try {
      dynamic response = await _apiServices.post(url: ApiEndPoint.login, data: data);
      return AuthModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future register({
    required String username,
    required String fullname,
    required String email,
    required String password,
    required String phone,
    required String citizenId,
    required String bloodGroup,
  }) async {
    Map<String, String> data = {
      // "username": username,
      "fullName": fullname,
      "email": email,
      "phone": phone,
      "idCard": citizenId,
      "password": password,
    };

    if (bloodGroup != '') {
      data.addAll({"bloodGroup": bloodGroup});
    }

    try {
      dynamic response = await _apiServices.post(url: ApiEndPoint.register, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future refreshToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    Map<String, String> data = {
      "accessToken": accessToken,
      "refreshToken": refreshToken,
    };

    try {
      dynamic response = await _apiServices.post(url: ApiEndPoint.refreshToken, data: data);

      return AuthModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future forgotPassword({required String email}) async {
    Map<String, String> data = {
      "email": email,
    };
    try {
      dynamic response = await _apiServices.post(url: ApiEndPoint.forgotPassword, data: data);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthModel> resetPassword(
      {required String email, required String code, required String password}) async {
    Map<String, String> data = {
      "email": email,
      "code": code,
      "password": password,
    };

    try {
      dynamic response = await _apiServices.post(url: ApiEndPoint.resetPassword, data: data);

      return AuthModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logOut() async {
    await SharedPrefService.instance.deleteUserRefreshToken();
    await SharedPrefService.instance.deleteUserToken();
  }
}
