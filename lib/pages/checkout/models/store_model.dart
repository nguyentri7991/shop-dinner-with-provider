class StoreModel {
  int id;
  String storeName;
  String address;
  String createdAt;
  String updatedAt;

  StoreModel(
      {required this.id,
      required this.storeName,
      required this.address,
      required this.createdAt,
      required this.updatedAt});

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      storeName: json['tencuahang'],
      address: json['diachi'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at']
    );
  }
}
