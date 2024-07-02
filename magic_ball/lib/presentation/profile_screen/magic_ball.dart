import 'package:change_theme/presentation/profile_screen/stars_screen.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MagicBallMain extends StatefulWidget {
  const MagicBallMain({super.key});

  @override
  State<MagicBallMain> createState() => _MagicBallMainState();
}

class _MagicBallMainState extends State<MagicBallMain> {
  late ShakeDetector detector;

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {},
    );
    detector.startListening();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StarsScreen()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppLocalizations.of(context)!.magicBallBackImg,
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.magicBallTitlePart1,
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  AppLocalizations.of(context)!.magicBallTitlePart2,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
