import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../Useful/Functions.dart';
import '../../../Useful/Model.dart';
import '../../../Useful/Widget.dart';
import 'Onboarding Screen.dart';


class Question_2 extends StatefulWidget {
  final PageController controller;
  const Question_2({Key? key, required this.controller}) : super(key: key);

  @override
  State<Question_2> createState() => _Question_2State();
}

List<QuestionModel> questions = [
  QuestionModel("assets/OS2/book.png", "Improve reading speed", false),
  QuestionModel("assets/OS2/smart.png", "Read more easily", false),
  QuestionModel("assets/OS2/learning.png", "Improve comprehension", false),
  QuestionModel("assets/OS2/multitasking.png", "Read and multitask", false)
];

class _Question_2State extends State<Question_2> {
  Map<String, dynamic> _userData = {};
  List<String> selectedAnswers = [];
  bool isContinueButtonVisible = false;
  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    Map<String, dynamic> userData = await UserDataFetcher.fetchUserData();
    setState(() {
      _userData = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StepProgressIndicator(
            totalSteps: 4,
            currentStep: 2,
            selectedColor: Colors.blue,
            unselectedColor: Colors.grey,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width,
            child: Text(
              "What do you want Doctunes to help you do,${_userData['displayName']}",
              style: GoogleFonts.roboto(
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Select all that apply",
              style: GoogleFonts.roboto(
                  color: hexStringToColor("#6B6B6B"),
                  fontSize: MediaQuery.of(context).size.width * 0.038,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            padding: const EdgeInsets.all(10),
            itemExtent: MediaQuery.of(context).size.width * 0.18,
            shrinkWrap: true,
            itemCount: questions.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                  onTap: () {
                    toggleSelection(index);
                  },
                  child: ListItemWidget(
                    img: questions[index].img,
                    title: questions[index].title,
                    isSelected: questions[index].isSelected,
                  ));
            },
          ),
          Expanded(
            child: SizedBox(
              height: 236,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  SvgPicture.asset(
                    'assets/AuthBG/Vector-1.svg',
                    width: MediaQuery.of(context).size.width,
                  ),
                  SvgPicture.asset(
                    'assets/AuthBG/Vector-2.svg',
                    width: MediaQuery.of(context).size.width,
                  ),
                  SvgPicture.asset(
                    'assets/AuthBG/Vector-3.svg',
                    width: MediaQuery.of(context).size.width,
                  ),
                  SvgPicture.asset(
                    "assets/AuthBG/Vector-4.svg",
                    width: MediaQuery.of(context).size.width,
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Visibility(
                      visible: isContinueButtonVisible,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.48,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.shade400,
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            onPressed: () {
                              onSave(context);
                              widget.controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text(
                              "Continue",
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void toggleSelection(int index) {
    setState(() {
      questions[index].isSelected = !questions[index].isSelected;
    });

    final selectedAnswer = questions[index].getAnswer();

    if (questions.any((q) => q.isSelected)) {
      setState(() {
        isContinueButtonVisible = true;
      });

      if (questions[index].isSelected) {
        selectedAnswers.add(selectedAnswer);
      } else {
        selectedAnswers.remove(selectedAnswer);
      }
    } else {
      setState(() {
        isContinueButtonVisible = false;
      });
    }
  }

  void onSave(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final auth = FirebaseAuth.instance;
    final uid = auth.currentUser?.uid;
    final userDocRef = firestore.collection('users').doc(uid);

    userDocRef.update({
      'Question 2': selectedAnswers,
    }).then((value) {
      // Navigate to the next screen
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => const language_Selection()));
    }).catchError((error) {
      // Handle any errors
      print('Error saving answers: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error saving answers')),
      );
    });
  }
}
