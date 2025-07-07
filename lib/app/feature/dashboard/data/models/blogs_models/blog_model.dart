class BlogModel {
  final String imageUrl;
  final String title;
  final String date;
  final String description;
  final int viewCount;
  final int commentCount;
  final String type;

  BlogModel(
      {required this.imageUrl,
      required this.title,
      required this.date,
      required this.description,
      required this.viewCount,
      required this.type,
      required this.commentCount});

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
        imageUrl: json["imageUrl"],
        title: json['title'],
        date: json['date'],
        description: json['description'],
        viewCount: json['viewCount'],
        type: json["type"],
        commentCount: json['commentCount']);
  }
}
