import 'package:colored_box/data/api/model/model_color.dart';
import 'package:colored_box/domain/entity/color_entity.dart';

ColorEntity? _mapColor(ColorData data) {
  final value = data.value;
  final name = data.name;

  if (value == null) return null;

  return ColorEntity(name: name, value: value);
}

class ColorMapper {
  List<ColorEntity> mapColors(List<ColorData> data) {
    final mappedList = <ColorEntity>[];
    for (var e in data) {
      final entity = _mapColor(e);
      if (entity != null) mappedList.add(entity);
    }
    return mappedList;
  }
}
