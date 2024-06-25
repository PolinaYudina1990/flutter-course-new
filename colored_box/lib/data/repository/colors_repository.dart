import 'package:colored_box/data/api/colors_api.dart';
import 'package:colored_box/data/mapper/color_mapper.dart';
import 'package:colored_box/domain/entity/color_entity.dart';

final class ColorRepository {
  final ColorsApi _colorsApi;
  final ColorMapper _colorMapper;

  ColorRepository(
      {required ColorsApi colorsApi, required ColorMapper colorMapper})
      : _colorsApi = colorsApi,
        _colorMapper = colorMapper;

  Future<List<ColorEntity>> getColors() =>
      _colorsApi.getColors().then(_colorMapper.mapColors);
}
