import 'package:uteer/data/remote/api_endpoint.dart';
import 'package:uteer/models/provinces/district_model.dart';
import 'package:uteer/models/provinces/province_model.dart';
import 'package:uteer/models/provinces/ward_model.dart';
import 'package:uteer/services/network_api_service.dart';
import 'package:uteer/utils/log_utils.dart';

abstract class ProvinceRepository {
  final List<ProvinceModel> _provinces = [];
  List<ProvinceModel> get provinces => _provinces;

  List<String> getProvincesName() {
    LogUtils.d(_provinces.length.toString());
    return _provinces.map((e) => e.name).toList();
  }

  Future<List<ProvinceModel>> getProvinces();
  Future<List<DistrictModel>> getDistricts(String provinceId);
  Future<List<WardModel>> getWards(String provinceId, int districtCode);
}

class ProvinceRepositoryImpl extends ProvinceRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  @override
  Future<List<ProvinceModel>> getProvinces() async {
    try {
      final resp = await _apiServices.get(url: ApiEndPoint.provinces);

      if (resp['data'] != null) {
        resp['data'].forEach((v) {
          _provinces.add(ProvinceModel.fromJson(v));
        });
      }

      // LogUtils.d("${_provinces[0].name} - ${_provinces.length}");

      return _provinces;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<DistrictModel>> getDistricts(String provinceId) async {
    List<DistrictModel> districts = [];
    try {
      final resp = await _apiServices.get(url: "${ApiEndPoint.districts}$provinceId/districts");

      if (resp['data'] != null) {
        resp['data'].forEach((v) {
          districts.add(DistrictModel.fromJson(v));
        });
      }

      return districts;
    } catch (e) {
      LogUtils.d("${ApiEndPoint.districts}/$provinceId/districts");
      rethrow;
    }
  }

  @override
  Future<List<WardModel>> getWards(String provinceId, int districtCode) async {
    List<WardModel> wards = [];
    try {
      final resp = await _apiServices.get(
          url: "${ApiEndPoint.districts}$provinceId/districts/wards?districtsCode=$districtCode");

      if (resp['data'] != null) {
        resp['data']['district']['wards'].forEach((v) {
          wards.add(WardModel.fromJson(v));
        });
      }

      return wards;
    } catch (e) {
      LogUtils.d("${ApiEndPoint.districts}$provinceId/districts/wards?districtsCode=$districtCode");
      rethrow;
    }
  }
}
