import 'dart:async';
import 'dart:developer';
import 'dart:math';

import 'package:async/async.dart';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'package:quiz/color/constant.dart';
import 'package:quiz/front/scorepage.dart';
import 'package:quiz/front/widgets/header.dart';
import 'package:quiz/front/widgets/headerquiz.dart';
import 'package:quiz/front/widgets/question_and_answer/option_widget.dart';
import 'package:quiz/front/widgets/question_and_answer/question_widget.dart';

import '../model/questionmodel.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  static const maxSeconds = 30;
  var coundownt = maxSeconds;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (coundownt > 0) {
        setState(() {
          coundownt--;
        });
      } else {
        nextQuestion();
        coundownt = maxSeconds;
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  void checkquestion() {
    if (index < _questions.length - 1) {
      startTimer();
    }
    if (index > _questions.length - 1) {
      stopTimer();
    }
  }

  @override
  void initState() {
    checkquestion();
    super.initState();
  }

  List<Question> _questions = [
    Question(id: '10', title: 'What is the capital of Indonesia?', options: {
      'answer 1 is 5': false,
      'answer 1 is 30': false,
      'answer 1 is 10': true,
      'answer 1 is 20': false,
      'answer 1 is 21': false
    }),
    Question(
        id: '12',
        title: 'What The F wakodawkodkawodkawodkawo',
        options: {
          'answer 2 is 5': false,
          'answer 2 is 30': true,
          'answer 2 is 10': false,
          'answer 2 is 20': false,
          'answer 2 is 21': false
        }),
    Question(
        id: '13',
        title: 'What is the capital of United State of America?',
        options: {
          'answer 3 is 5': false,
          'answer 3 is 30': false,
          'answer 3 is 10': false,
          'answer 3 is 20': false,
          'answer 3 is 21': true
        })
  ];

  int index = 0;
  void nextQuestion() {
    if (index >= _questions.length - 1 && coundownt > 0) {
      stopTimer();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.bottomSlide,
        title: 'Great Job',
        desc: 'You answer all questions, see the result',
        btnOkOnPress: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ScorePage(
                      score: score,
                      totalQuestion: _questions.length.toInt(),
                      questions: _questions,
                      trueKeys: trueKeys,
                    ))),
        btnOkColor: correct,
      ).show();
    } else if (index >= _questions.length - 1) {
      stopTimer();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.bottomSlide,
        title: 'Times Up',
        desc: 'Times Up, move to result',
        btnOkOnPress: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ScorePage(
                      score: score,
                      totalQuestion: _questions.length.toInt(),
                      questions: _questions,
                      trueKeys: trueKeys,
                    ))),
        btnOkColor: correct,
      ).show();
    } else {
      setState(() {
        _questions[index].options.forEach(((key, value) {
          if (value == true) {
            trueKeys.add(key);
          }
        }));
        index++;
      });
    }
  }

  void changeQuestion() {
    nextQuestion();
    coundownt = maxSeconds;
  }

  int score = 0;

  void scoreUpdate(bool value) {
    if (value == true) {
      score++;
    }
    changeQuestion();
  }

  List<String> trueKeys = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff14284f),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: HeaderQuizPage(
                  title: 'Quiz Page',
                  onTap_: () {
                    timer?.cancel();
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      animType: AnimType.bottomSlide,
                      title: 'Exit',
                      desc: 'Are you sure to exit?',
                      btnOkOnPress: () => Navigator.pop(context),
                      btnOkColor: correct,
                      btnCancelColor: incorrect,
                      btnCancelOnPress: () => startTimer(),
                    ).show();
                  },
                ),
              ),
              LinearProgressIndicator(
                backgroundColor: Colors.white12,
                minHeight: 5,
                color: Color(0xfffdd083),
                value: coundownt / maxSeconds,
              ),
              QuestionWidget(
                question: _questions[index].title,
              ),
              SizedBox(
                height: 40,
              ),
              for (int i = 0; i < _questions[index].options.length; i++)
                InkWell(
                  onTap: () {
                    scoreUpdate(_questions[index].options.values.toList()[i]);
                    print(trueKeys.length);
                    print(score);
                  },
                  child: OptionsWidget(
                    options: _questions[index].options.keys.toList()[i],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
