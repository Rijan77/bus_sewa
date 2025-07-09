import 'package:bus_sewa/app/feature/dashboard/data/models/video_model.dart';
import 'package:dio/dio.dart';

class VideoApi {
  final dio = Dio();

  String apiUrl =
      'https://api.pexels.com/videos/search?query=nature&per_page=10';
  String apiKey = 'JVEhtxgAKxUAd1FKJW74rPm4r7znY9l2caX3hTO2li0E5zSCslinypXW';

  Future<dynamic> fetchVideos() async {
    try {
      final response = await dio.get(
        apiUrl,
        options: Options(
          headers: {'Authorization': apiKey},
        ),

        // final response = await dio.get(
        //   Uri.parse(apiUrl),
        //   headers: {
        //     'Authorization': apiKey,
        //   },
      );

      if (response.statusCode == 200) {
        // final data = json.decode(response.body);
        final data = response.data;
        final List videos = data["videos"];
        return videos.map((json) => VideoModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load videos');
      }
    } catch (e) {
      throw Exception('Error fetching video: $e');
    }
  }
}
