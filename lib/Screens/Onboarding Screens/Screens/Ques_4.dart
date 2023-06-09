import 'package:doctunes/Screens/MainScreens/MyFiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../Useful/Functions.dart';
import 'Language_Selection.dart';


class Question_4 extends StatefulWidget {
  final PageController controller;
  const Question_4({Key? key, required this.controller}) : super(key: key);

  @override
  State<Question_4> createState() => _Question_4State();
}

class _Question_4State extends State<Question_4> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StepProgressIndicator(
            totalSteps: 4,
            currentStep: 4,
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
              "Do you want to translate to any other language?",
              style: GoogleFonts.roboto(
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyFiles()));
            },
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                color:     hexStringToColor('#F1F2F3'),
                  border: Border.all(color: hexStringToColor("#6B6B6B")),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ]),
              child: Center(
                child: Text(
                  "No",
                  style: GoogleFonts.roboto(
                      color: hexStringToColor("#6B6B6B"),
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          GestureDetector(
            onTap: () {
              setState(() {
                isSelected = true;
              });
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const language_Selection()));
            },
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                  gradient: isSelected
                      ? LinearGradient(colors: [
                          hexStringToColor('#2196F3'),
                          hexStringToColor('#004DE1')
                        ])
                      : LinearGradient(colors: [
                          hexStringToColor('#F1F2F3'),
                          hexStringToColor('#F1F2F3')
                        ]),
                  border: Border.all(color: hexStringToColor("#6B6B6B")),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ]),
              child: Center(
                child: Text(
                  "Yes",
                  style: GoogleFonts.roboto(
                      color: hexStringToColor("#6B6B6B"),
                      fontWeight: FontWeight.w500,
                      fontSize: 25),
                ),
              ),
            ),
          ),    Expanded(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
