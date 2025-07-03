class PromoCodeModel {
  final String imageUrl;
  final String title;
  final String validDate;
  final String promoType;

  PromoCodeModel(
      {required this.imageUrl, required this.title, required this.validDate, required this.promoType});

  factory PromoCodeModel.fromJson(Map<String, dynamic> json) {
    return PromoCodeModel(
        imageUrl: json["imageUrl"],
        title: json["title"],
      validDate: json["validDate"],
        promoType: json["promoType"],
    );

  }
}
