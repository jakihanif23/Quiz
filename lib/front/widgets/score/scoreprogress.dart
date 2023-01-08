import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:math' as math;

import '../../../color/constant.dart';

class ScoreProgress extends StatelessWidget {
  final int score;
  final int totalQuestion;
  const ScoreProgress({super.key, required this.score, required this.totalQuestion});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Text(
              '${score} / ${totalQuestion}',
              style: TextStyle(
                  color: neutral, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: CircularProgressIndicator(
              strokeWidth: 5,
              value: score / totalQuestion,
              color: Color(0xff80c682),
              backgroundColor: Color(0xffe37373),
            ),
          )
        ],
      ),
    );
  }
}
