// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:adv_app/data/questions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chosenAns});

  final List<String> chosenAns;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAns.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAns[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered X Out Of Y question Correctly"),
            SizedBox(height: 30),
            // now scrollable list for ques ans and correct ans
            Text('List of answer and questions.....'),
            SizedBox(height: 30),
            TextButton(
              onPressed: () {},
              child: Text("Restart Quz"),
            ),
          ],
        ),
      ),
    );
  }
}
