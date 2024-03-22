import 'package:flutter/material.dart';

class GestureContainer extends StatefulWidget {
  const GestureContainer({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GestureContainer> createState() => _GestureContainerState();
}

class _GestureContainerState extends State<GestureContainer>
    with TickerProviderStateMixin {
  Offset _offset = Offset.zero;
  int index = 0;
  List<Color> mycolors = [
    Colors.pink,
    Colors.red,
    Colors.green,
    Colors.blue,
  ];
  // AnimationController _controller;
  late final _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 300),
    upperBound: 0.5,
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Positioned(
            left: _offset.dx,
            top: _offset.dy,
            child: GestureDetector(
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 0.5).animate(_controller),
                child: Draggable(
                  feedback: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue.withOpacity(0.5),
                  ),
                  onDragStarted: () {
                    setState(() {});
                  },
                  onDragEnd: (details) {
                    setState(() {});
                  },
                  onDragUpdate: (details) {
                    setState(() {
                      _offset = Offset(
                        _offset.dx + details.delta.dx,
                        _offset.dy + details.delta.dy,
                      );
                    });
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: mycolors[index],
                  ),
                ),
              ),
              onTap: () {
                index++;
                if (index >= mycolors.length) index = 0;
                setState(() {});
              },
              onLongPress: () {
                setState(() {
                  _controller.reverse(from: 0.5);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
