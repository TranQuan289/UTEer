class ProvinceModel {
  String sId;
  String name;
  int code;
  String codename;
  String divisionType;
  int phoneCode;

  ProvinceModel(
      {required this.sId,
      required this.name,
      required this.code,
      required this.codename,
      required this.divisionType,
      required this.phoneCode});

  ProvinceModel.fromJson(Map<String, dynamic> json)
      : sId = json['_id'],
        name = json['name'],
        code = json['code'],
        codename = json['codename'],
        divisionType = json['division_type'],
        phoneCode = json['phone_code'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['code'] = code;
    data['codename'] = codename;
    data['division_type'] = divisionType;
    data['phone_code'] = phoneCode;
    return data;
  }
}
