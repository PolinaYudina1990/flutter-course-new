import 'dart:convert';

import 'package:colored_box/data/api/colors_api.dart';
import 'package:colored_box/data/api/colors_api_urls.dart';
import 'package:colored_box/data/api/model/model_color.dart';
import 'package:flutter/services.dart';

class ColorsApiFromAssets implements ColorsApi {
  @override
  Future<List<ColorData>> getColors() async {
    final colors = <ColorData>[];

    String colorsString = await rootBundle.loadString(ColorsApiUrls.colors);
    final jsonResult = json.decode(colorsString) as Map<String, dynamic>;

    final colorsList = jsonResult['colors'] as List;

    if (colorsList.isNotEmpty)
      for (final e in colorsList) {
        colors.add(ColorData.fromJson(e as Map<String, dynamic>));
      }

    return colors;
  }
}
