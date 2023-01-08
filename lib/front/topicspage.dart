import 'package:flutter/material.dart';
import 'package:quiz/front/quizpage.dart';
import 'package:quiz/front/widgets/header.dart';
import 'package:quiz/front/widgets/topicsquestion.dart';

class Topics extends StatefulWidget {
  const Topics({super.key});

  @override
  State<Topics> createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  @override
  Widget build(BuildContext context) {
    List<String> data = ['politics', 'animals', 'general'];

    return Scaffold(
      backgroundColor: const Color(0xff14284f),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: HeaderAndBackButton(
                  title: 'Topics',
                  onTap_: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: List.generate(data.length, (index) {
                  return Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => QuizPage())));
                          },
                          child: TopicsQuestion(title: data[index])),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
