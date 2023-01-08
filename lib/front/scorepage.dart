import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz/database/connect_db.dart';
import 'package:quiz/front/widgets/header.dart';
import 'package:quiz/front/widgets/score/scoreprogress.dart';
import 'package:quiz/model/questionmodel.dart';

import '../color/constant.dart';

class ScorePage extends StatefulWidget {
  final int score;
  final int totalQuestion;
  final List<String> trueKeys;
  const ScorePage(
      {super.key,
      required this.score,
      required this.totalQuestion,
      required this.trueKeys});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  var db = httpFunction();
  late Future _questions;
  Future<List<Question>> getData() async {
    return db.getQuestion();
  }

  @override
  void initState() {
    _questions = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> trueKeys = widget.trueKeys;
    return FutureBuilder(
        future: _questions as Future<List<Question>>,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              var extractedData = snapshot.data as List<Question>;
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
                            score: widget.score,
                            totalQuestion: widget.totalQuestion),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text('Share your score')),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Your Report',
                          style: TextStyle(
                              color: neutral,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  List.generate(extractedData.length, (index) {
                                MapEntry cek = extractedData[index]
                                    .options
                                    .entries
                                    .firstWhere(
                                        (element) => element.value == true);
                                print('${cek.key}');
                                return Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${extractedData[index].title}',
                                        style: TextStyle(
                                            color: neutral, fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.task_alt_rounded,
                                            color: correct,
                                          ),
                                          Text(
                                            ' ${cek.key}',
                                            style: TextStyle(color: neutral),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                );
                              }),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Center(
            child: Text('No Data'),
          );
        });
  }
}
