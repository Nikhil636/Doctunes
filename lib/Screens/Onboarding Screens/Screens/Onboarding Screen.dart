
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Ques_1.dart';
import 'Ques_2.dart';
import 'Ques_3.dart';
import 'Ques_4.dart';

// class AnswersProvider with ChangeNotifier {
//   final List<String> _answers = ['', '', ''];
//   final List<String> _selectedAnswers = [];
//
//   List<String> get answers => _answers;
//   List<String> get selectedAnswers => _selectedAnswers;
//   String selectedAnswer='';
//
//   void setSelectedAnswer(String answer) {
//     selectedAnswer = answer;
//   }
//
//   set answers(List<String> answer) {
//     _answers.addAll(answer);
//     notifyListeners();
//   }
//
//   void addSelectedAnswer(String answer) {
//     _selectedAnswers.add(answer);
//     notifyListeners();
//   }
//
//   void removeSelectedAnswer(String answer) {
//     _selectedAnswers.remove(answer);
//     notifyListeners();
//   }
//
//   void clearAnswers() {
//     _answers.clear();
//     _selectedAnswers.clear();
//     notifyListeners();
//   }
// }

class Onboarding_Main extends StatefulWidget {
  const Onboarding_Main({Key? key}) : super(key: key);

  @override
  State<Onboarding_Main> createState() => _Onboarding_MainState();
}

class _Onboarding_MainState extends State<Onboarding_Main> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  Question_1(controller: controller               ),
                  Question_2(controller: controller),
                  Question_3(controller: controller),
                  Question_4()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
