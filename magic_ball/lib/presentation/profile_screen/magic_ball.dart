import 'package:change_theme/data/api/magic_ball_api.dart';
import 'package:change_theme/data/api/model/model_mb.dart';
import 'package:change_theme/presentation/profile_screen/stars_screen.dart';
import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MagicBallMain extends StatefulWidget {
  final MagicBallApi magicBallApi;
  const MagicBallMain({super.key, required this.magicBallApi});

  @override
  State<MagicBallMain> createState() => _MagicBallMainState();
}

class _MagicBallMainState extends State<MagicBallMain>
    with TickerProviderStateMixin {
  late ShakeDetector detector;
  var squareScale = 1.0;
  late AnimationController _controller;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        _loadReply();
      },
    );
    _controller = AnimationController(
        vsync: this,
        lowerBound: 1.0,
        upperBound: 3.0,
        duration: const Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {
        squareScale = _controller.value;
      });
    });
    detector.startListening();
  }

  Future<MagicBallData>? _data;
  Future<void> _loadReply() async {
    _data = widget.magicBallApi.getReplies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            InkWell(
              onTap: () {
                _loadReply();
                if (_controller.isCompleted) {
                  _controller.reverse();
                } else {
                  _controller.forward(from: 0.0);
                }
                isVisible ? isVisible = false : isVisible = true;
              },
              child: Transform.scale(
                scale: squareScale,
                child: Container(
                  width: MediaQuery.of(context).size.width * 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        AppLocalizations.of(context)!.magicBallBackImg,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (isVisible == true)
              FutureBuilder<MagicBallData>(
                future: _data,
                builder: (_, snapshot) {
                  if (snapshot.data == null) {
                    return const LoadingWidget();
                  }
                  if (snapshot.hasError || !snapshot.hasData) {
                    return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                              opacity: animation, child: child);
                        },
                        child: const MyErrorWidget());
                  }
                  final data = snapshot.data!;
                  return AnimatedOpacity(
                      opacity: isVisible ? 1.0 : 0.0,
                      duration: const Duration(seconds: 3),
                      curve: Curves.bounceInOut,
                      child: ReplyWidget(data: data));
                },
              ),
            if (isVisible == false)
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
    );
  }
}
