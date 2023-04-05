class DistrictModel {
  String name;
  int code;
  String codename;
  String divisionType;
  String shortCodename;

  DistrictModel(
      {required this.name,
      required this.code,
      required this.codename,
      required this.divisionType,
      required this.shortCodename});

  DistrictModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        code = json['code'],
        codename = json['codename'],
        divisionType = json['division_type'],
        shortCodename = json['short_codename'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    data['codename'] = codename;
    data['division_type'] = divisionType;
    data['short_codename'] = shortCodename;
    return data;
  }
}
