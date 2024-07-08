// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:change_theme/data/api/magic_ball_api.dart';
import 'package:change_theme/data/api/model/model_mb.dart';
import 'package:dio/dio.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

class MyErrorWidget extends StatelessWidget {
  const MyErrorWidget({
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
          style: TextStyle(fontSize: 56, color: Colors.white),
        ),
      ),
    );
  }
}
