import 'package:change_theme/data/api/magic_ball_api_urls.dart';
import 'package:dio/dio.dart';
import 'package:change_theme/data/api/model/model_mb.dart';

class MagicBallApi {
  Future<MagicBallData> getReplies() async {
    MagicBallData? replies;
    final dio = Dio();

    // try {
    final repliesString = await dio.get(MagicBallApiUrls.replies);
    replies = MagicBallData.fromJson(repliesString.data);
    return replies;
  }
}
