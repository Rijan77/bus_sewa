class VideoModel {
  final int id;
  final String image;
  final String videoUrl;
  final String userName;

  VideoModel({
    required this.id,
    required this.image,
    required this.videoUrl,
    required this.userName,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      image: json['image'],
      videoUrl: json['video_files'][0]['link'],
      userName: json['user']['name'],
    );
  }
}
