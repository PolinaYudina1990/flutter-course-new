import 'package:colored_box/data/api/model/model_color.dart';

abstract class ColorsApi {
  Future<List<ColorData>> getColors();
}
