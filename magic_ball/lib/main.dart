import 'package:change_theme/data/api/magic_ball_api.dart';
import 'package:change_theme/presentation/profile_screen/magic_ball.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

final magicBallApi = MagicBallApi();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', ''),
      ],
      home: Scaffold(
          body: MagicBallMain(
        magicBallApi: magicBallApi,
      )),
    );
  }
}
