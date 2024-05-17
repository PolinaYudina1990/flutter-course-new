import 'package:json_annotation/json_annotation.dart';

part 'model_color.g.dart';

@JsonSerializable()
class ColorData {
  final String name;
  final String? value;

  ColorData(this.name, this.value);

  factory ColorData.fromJson(Map<String, dynamic> json) =>
      _$ColorDataFromJson(json);
}
