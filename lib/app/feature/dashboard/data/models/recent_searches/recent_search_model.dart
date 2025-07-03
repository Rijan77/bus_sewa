
class RecentSearchModel {

  final String transportType;
  final String departurePlace;
  final String arrivalPlace;
  final String date;
  final int passangerNumber;

  RecentSearchModel({
    required this.transportType,
    required this.departurePlace,
    required this.arrivalPlace,
    required this.date,
    required this.passangerNumber
  });


  factory RecentSearchModel.fromJson(Map <String, dynamic> json){
    return RecentSearchModel(
      transportType: json["transportType"],
      departurePlace: json["departurePlace"],
      arrivalPlace: json['arrivalPlace'],
      date: json["date"],
     passangerNumber: json['passangerNumber'],


    );
  }


}