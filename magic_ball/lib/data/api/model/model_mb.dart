class MagicBallData {
  final String reply;

  MagicBallData({
    required this.reply,
  });

  factory MagicBallData.fromJson(Map<String, dynamic> json) {
    return MagicBallData(
      reply: json['reading'] as String,
    );
  }
}
