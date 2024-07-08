import 'dart:async';
import 'package:change_theme/data/api/magic_ball_api.dart';
import 'package:change_theme/data/api/model/model_mb.dart';
import 'package:dio/dio.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// final magicBallApi = MagicBallApi();
final dio = Dio();

class StarsScreen extends StatefulWidget {
  final Future<MagicBallData>? data;
  const StarsScreen({super.key, required this.data});

  @override
  State<StarsScreen> createState() => _StarsScreenState();
}

class _StarsScreenState extends State<StarsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppLocalizations.of(context)!.magicBallStarsImg,
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            FutureBuilder<MagicBallData>(
              future: widget.data,
              builder: (_, snapshot) {
                if (snapshot.data == null) {
                  return const LoadingWidget();
                }
                if (snapshot.hasError || !snapshot.hasData) {
                  return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: const ErrorWidget());
                }
                final data = snapshot.data!;
                return InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ReplyWidget(data: data),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  int _currentPosition = 0;

  void updateProgress() {
    Timer.periodic(const Duration(milliseconds: 700), (Timer t) {
      if (mounted) {
        setState(() {
          _currentPosition += 1;
          if (_currentPosition >= 3) {
            _currentPosition = 0;
          }
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateProgress();
  }

  @override
  Widget build(BuildContext context) {
    final decorator = DotsDecorator(
      color: Colors.white,
      activeColor: Colors.white,
      size: const Size.square(10.0),
      activeSize: const Size.square(16.0),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
    );

    return Center(
      child: DotsIndicator(
        dotsCount: 3,
        position: _currentPosition,
        reversed: false,
        decorator: decorator,
      ),
    );
  }
}

class ReplyWidget extends StatelessWidget {
  final MagicBallData data;
  const ReplyWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          data.reply,
          style: const TextStyle(fontSize: 56, color: Colors.white),
        ),
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          AppLocalizations.of(context)!.magicBallErrorMessage,
          style: const TextStyle(fontSize: 56, color: Colors.white),
        ),
      ),
    );
  }
}
