import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gesture_x_detector/gesture_x_detector.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _tapX = -10.0;
  double _tapY = -10.0;

  void _setTapPos(double tapX, double tapY) {
    setState(() {
      _tapX = tapX;
      _tapY = tapY;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          XGestureDetector(
            child: Container(
              color: Colors.greenAccent,
              child: SizedBox(
                width: size.width,
                height: size.height,
              ),
            ),
            onTap: (event) {
              final x = event.localPos.dx;
              final y = event.localPos.dy;
              log("tap($x, $y)");
              _setTapPos(x, y);
            },
          ),
          Positioned(
            left: _tapX - 10,
            top: _tapY - 10,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
