class AuthModel {
  int id;
  String name;
  String phone;
  int point;

  AuthModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.point});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'],
      name: json['tenKH'],
      phone: json['sodienthoai'],
      point: json['point'],
    );
  }
}
