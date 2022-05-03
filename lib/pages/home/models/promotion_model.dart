class PromotionModel {
  final int id;
  final String name;
  final String startDate;
  final String endDate;
  PromotionModel({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
  });
  factory PromotionModel.fromJson(Map<String, dynamic> json) {
    return PromotionModel(
      id: json['id'],
      name: json['tendot'],
      startDate: json['ngayBD'],
      endDate: json['ngayKT'],
    );
  }
}
