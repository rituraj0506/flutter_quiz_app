import 'package:adv_app/pages/IntroPage.dart';
import 'package:adv_app/pages/quiz.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Quiz();
  }
}
