// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Intropage extends StatelessWidget {
  // accept fun as an argument and indirectly call the fun
  const Intropage(this.StartQuiz, {super.key});

  final void Function() StartQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assests/images/quiz-logo.png',
            width: 300,
            //  color: Colors.red,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          SizedBox(
            height: 80,
          ),
          Text(
            "Learn flutter the fun Way!", 
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: StartQuiz,
            label: Text(
              "Start Quiz",
              style: TextStyle(color: Colors.white),
            ),
            icon: Icon(Icons.arrow_right_alt),
          ),
        ],
      ),
    );
  }
}
