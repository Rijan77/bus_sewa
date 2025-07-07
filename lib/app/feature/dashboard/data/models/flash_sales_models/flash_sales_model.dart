class FlashSaleModel {
  final String time;
  final String discount;
  final String hotelName;
  final String imageUrl;
  final String flashSellType;



  FlashSaleModel(
      {required this.time,
      required this.imageUrl,
      required this.discount,
      required this.hotelName,
        required this.flashSellType
      });

  factory FlashSaleModel.fromJson(Map<String, dynamic> json) {
    return FlashSaleModel(
        time: json["time"],
        imageUrl: json["imageUrl"],
        discount: json["discount"],
        flashSellType: json["flashSellType"],
        hotelName: json["hotelName"]);
  }
}
