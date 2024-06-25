import 'package:colored_box/assets/color_strings.dart';
import 'package:colored_box/assets/colors.dart';
import 'package:colored_box/assets/fonts.dart';
import 'package:colored_box/domain/entity/color_entity.dart';
import 'package:colored_box/main.dart';
import 'package:colored_box/presentation/color_detailed_screen.dart';
import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  Future<List<ColorEntity>>? _data;

  @override
  void initState() {
    super.initState();
    _loadColors();
  }

  Future<void> _loadColors() async {
    _data = colorsRepository.getColors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              AppStrings.appBarTitleColorScreen,
              style: AppTypography.fontForTitleAppBarColorScreen,
              maxLines: 2,
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<ColorEntity>>(
        future: _data,
        builder: (_, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const LoadingWidget();
          }
          if (snapshot.hasError) {
            return const ErrorWdget();
          }
          if (!snapshot.hasData) {
            return const EmptyWidget();
          }
          final data = snapshot.data!;
          return ContentWidget(data: data);
        },
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class ErrorWdget extends StatelessWidget {
  const ErrorWdget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Error'));
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Error'));
  }
}

class ContentWidget extends StatelessWidget {
  final List<ColorEntity> data;
  const ContentWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.75,
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10),
          itemCount: data.length,
          itemBuilder: (BuildContext ctx, index) {
            return ColorWidget(
              data: data[index],
            );
          }),
    );
  }
}

class ColorWidget extends StatelessWidget {
  final ColorEntity data;
  const ColorWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Color rgbColor = hexToColor(data.value!);

    return InkWell(
      onLongPress: () {
        onLongPress(
          context,
          data,
        );
      },
      onTap: () {
        onTapFunction(
          context,
          data,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: rgbColor,
                borderRadius: const BorderRadius.all(Radius.circular(16))),
          ),
          Text(
            data.name,
            style: AppTypography.fontColorWidgetText,
          ),
          Text(
            data.value,
            style: AppTypography.fontColorWidgetText,
          ),
        ],
      ),
    );
  }
}

Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
  return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
}

Future<void> onLongPress(BuildContext context, ColorEntity data) async {
  onTapCopy(data);
  showDialog(
    barrierColor: const Color(0x01000000),
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        backgroundColor: AppColors.alertDialogColor.withOpacity(0.8),
        alignment: Alignment.bottomCenter,
        content: Text(
          textAlign: TextAlign.center,
          AppStrings.allertDialog,
          style: AppTypography.fontDetailedScreen.copyWith(color: Colors.white),
        ),
      );
    },
  );
  await Future.delayed(const Duration(seconds: 1));
  Navigator.of(context, rootNavigator: true).pop();
}

void onTapFunction(BuildContext context, ColorEntity data) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => DetailedColorScreen(data: data),
    ),
  );
}
