import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz/model/questionmodel.dart';

class httpFunction {
  final url = Uri.parse(
      'https://quizapp-d20ae-default-rtdb.firebaseio.com/politics.json');
  Future<void> addQuestion(Question question) async {
    http.post(url,
        body: json
            .encode({'title': question.title, 'options': question.options}));
  }

  Future<List<Question>> getQuestion() async {
    return http.get(url).then((value) {
      var data = json.decode(value.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) {
        var newQuestion =
            Question(
              id: key, 
              title: value['title'], 
              options: Map.castFrom(value['options']));
        newQuestions.add(newQuestion);
      });
      return newQuestions;
    });
  }
}
