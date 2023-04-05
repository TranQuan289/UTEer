class UserModel {
  String id;
  String verify;
  String username;
  String fullName;
  String email;
  String phone;
  String citizenId;
  String bloodType;
  String? avatar;
  String gender = 'Nam';
  String addressCity;
  String addressDistrict;
  String addressWard;
  String birthYear;

  UserModel(
      {required this.id,
      required this.verify,
      required this.username,
      required this.fullName,
      required this.email,
      required this.phone,
      required this.citizenId,
      required this.bloodType,
      required this.birthYear,
      required this.addressCity,
      required this.addressDistrict,
      required this.addressWard});

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        verify = json['verify'],
        username = json['username'],
        fullName = json['fullName'],
        email = json['email'],
        phone = json['phone'],
        avatar = json['avatar'],
        citizenId = json['idCard'],
        bloodType = json['bloodGroup'] ?? "",
        addressCity = json['addressCity'] ?? "Đà Nẵng",
        addressDistrict = json['addressDistrict'] ?? "Thanh Khê",
        addressWard = json['address'] ?? "Thanh Khê Đông",
        birthYear = json['birth'] != null
            ? DateTime.parse(json['birth']).year.toString()
            : "1980";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['verify'] = verify;
    data['username'] = username;
    data['fullName'] = fullName;
    data['email'] = email;
    data['phone'] = phone;
    data['idCard'] = citizenId;
    data['bloodGroup'] = bloodType;
    data['avatar'] = avatar;
    data['gender'] = gender;
    data['addressCity'] = addressCity;
    data['addressDistrict'] = addressDistrict;
    data['address'] = addressWard;
    data['birth'] = birthYear;
    return data;
  }
}
