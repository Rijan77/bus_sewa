class PromoCodeModel {
  final String imageUrl;
  final String title;
  final String subTitle;

  PromoCodeModel({
    required this.imageUrl,
    required this.title,
    required this.subTitle
  });

  factory PromoCodeModel.fromJson(Map <String, dynamic> json){
  return PromoCodeModel(
  imageUrl: json["imageUrl"],
  title: json["title"],
  subTitle: json["subTitle"]);
  }
}