class FlashSaleModel {
  final String time;
  final String discount;
  final String hotelName;
  final String imageUrl;

  FlashSaleModel({
    required this.time,
    required this.imageUrl,
    required this.discount,
    required this.hotelName

  });

  factory FlashSaleModel.fromJson(Map<String, dynamic> json){
    return FlashSaleModel(
        time: json["time"], imageUrl: json["imageUrl"], discount: json["discount"], hotelName: json["hotelName"]);
  }

}