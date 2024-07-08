import 'package:change_theme/data/api/magic_ball_api.dart';
import 'package:change_theme/data/api/model/model_mb.dart';
import 'package:change_theme/presentation/profile_screen/stars_screen.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyInheritedWidget extends InheritedWidget {
  const MyInheritedWidget(
      {super.key, required this.child, required this.magicBallApi})
      : super(child: child);

  @override
  final Widget child;

  // message variable for
  // our inherited widget
  final MagicBallApi magicBallApi;

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return true;
  }
}

// final magicBallApi = MagicBallApi();

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
      onPhoneShake: () {
        _loadReply();
      },
    );
    detector.startListening();
  }

  Future<MagicBallData>? _data;
  Future<void> _loadReply() async {
    _data = MyInheritedWidget.of(context).magicBallApi.getReplies();
    print('fds $_data');
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      magicBallApi: MagicBallApi(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              InkWell(
                onTap: () {
                  _loadReply();
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation) {
                        return StarsScreen(data: _data);
                      },
                      transitionDuration: const Duration(seconds: 4),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
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
        ),
      ),
    );
  }
}
