import 'package:change_theme/data/api/magic_ball_api_urls.dart';
import 'package:dio/dio.dart';
import 'package:change_theme/data/api/model/model_mb.dart';

class MagicBallApi {
  Future<MagicBallData> getReplies() async {
    final dio = Dio();
    final repliesString = await dio.get(MagicBallApiUrls.readingUrl);
    if (repliesString.statusCode == 200) {
      return MagicBallData.fromJson(repliesString.data);
    } else {
      throw Exception('Failed to load album');
    }
  }
}
