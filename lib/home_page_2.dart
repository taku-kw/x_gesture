import 'dart:developer';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int buttonTapCnt = 0;
  int gestureDetectorTapCnt = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void _incrementButtonTapCnt() {
      setState(() {
        buttonTapCnt++;
      });
    }

    void _incrementGestureDetectorTapCnt() {
      setState(() {
        gestureDetectorTapCnt++;
      });
    }

    void _resetTapCnt() {
      setState(() {
        buttonTapCnt = 0;
        gestureDetectorTapCnt = 0;
      });
    }

    return Scaffold(
      body: DefaultTextStyle.merge(
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Roboto',
          letterSpacing: 0.5,
          fontSize: 36.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text("ElevatedButton"),
                Center(
                  child: Text(
                    "$buttonTapCnt",
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 56.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                const Text("GestureDetector"),
                Center(
                  child: Text(
                    "$gestureDetectorTapCnt",
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 56.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 200,
              height: 100,
              child: Stack(
                children: [
                  ElevatedButton(
                    child: const Icon(
                      Icons.add,
                      size: 40,
                    ),
                    onPressed: _incrementButtonTapCnt,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: _incrementGestureDetectorTapCnt,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _resetTapCnt,
              child: const Text(
                "Reset",
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
