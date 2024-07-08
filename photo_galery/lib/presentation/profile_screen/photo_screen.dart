import 'package:change_theme/assets/mock.dart';
import 'package:change_theme/presentation/profile_screen/widgets/photo_widget.dart';
import 'package:flutter/material.dart';

class PhotoScreen extends StatefulWidget {
  final int currentPhoto;
  const PhotoScreen({super.key, required this.currentPhoto});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  static const _defaultAnimDuration = Duration(milliseconds: 300);

  late int currentPhoto = widget.currentPhoto;

  late final _pageController = PageController(
    initialPage: currentPhoto,
    viewportFraction: 0.8,
  );

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_onPageChanged)
      ..dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final prevPage = currentPhoto;
    currentPhoto = _pageController.page?.round() ?? currentPhoto;
    if (prevPage != currentPhoto) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: RichText(
              text: TextSpan(
                  text: '$currentPhoto',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: '/${profilePhotos.length}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey),
                    ),
                  ]),
            ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: profilePhotos.length,
        itemBuilder: (_, i) => Center(
          child: AnimatedScale(
            duration: _defaultAnimDuration,
            scale: currentPhoto == i ? 1 : 0.9,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () => _pageController.animateToPage(
                  i,
                  duration: _defaultAnimDuration,
                  curve: Curves.easeIn,
                ),
                child: PageViewItem(color: profilePhotos[i]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
