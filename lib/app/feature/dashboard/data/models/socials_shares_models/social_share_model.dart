class SocialShareModel {
  final String videoUrl;
  final String title;
  final String subTitle;

  SocialShareModel({
    required this.videoUrl,
    required this.title,
    required this.subTitle,
  });

  factory SocialShareModel.fromJson(Map<String, dynamic> json) {
    return SocialShareModel(
        videoUrl: json['videoUrl'],
        title: json['title'],
        subTitle: json["subTitle"]);
  }
}
