class DetailSelectToppingModel {
  final int toppingId;

  DetailSelectToppingModel({
    required this.toppingId,
  });

  Map<String, dynamic> toJson() => {
        'chonthem_id': toppingId,
      };
}
