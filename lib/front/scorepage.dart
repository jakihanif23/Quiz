import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz/front/widgets/header.dart';
import 'package:quiz/front/widgets/score/scoreprogress.dart';
import 'package:quiz/model/questionmodel.dart';

import '../color/constant.dart';

class ScorePage extends StatefulWidget {
  final int score;
  final int totalQuestion;
  final List<Question> questions;
  final List<String> trueKeys;
  const ScorePage(
      {super.key,
      required this.score,
      required this.totalQuestion,
      required this.questions, required this.trueKeys});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    List<String> trueKeys = widget.trueKeys;
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HeaderAndBackButton(
                  title: 'Your Score',
                  onTap_: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ScoreProgress(
                  score: widget.score, totalQuestion: widget.totalQuestion),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Share your score')),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Your Report',
                style: TextStyle(
                    color: neutral, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              for(int i = 0; i < widget.questions.length; i++)...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      '${widget.questions[i].title}', 
                      textAlign: TextAlign.left,
                      style: TextStyle(color: neutral),
                    ),
                  ),
                ),
                SizedBox(height: 10,)
              ]
            ],
          ),
        ),
      ),
    );
  }
}
