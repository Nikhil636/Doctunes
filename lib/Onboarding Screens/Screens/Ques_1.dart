import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../Useful/Functions.dart';
import '../Model.dart';
import 'Onboarding Screen.dart';
import 'Widget.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class Question_1 extends StatefulWidget {

  Question_1({Key? key, required this.controller,}) : super(key: key);
  final PageController controller;
  @override
  State<Question_1> createState() => _Question_1State();
}

class _Question_1State extends State<Question_1> {

  String username = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
  List<QuestionModel> questions = [
    QuestionModel("assets/images/education 1.png", "School", false),
    QuestionModel("assets/images/freelance 1.png", "Work", false),
    QuestionModel("assets/images/bench 1.png", "Leisure", false)
  ];
  int selectedQuestionIndex = -1;
  Map<String, dynamic> _userData = {};

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
        children: [
          const   StepProgressIndicator(
            totalSteps: 3,
            currentStep: 1,
            selectedColor: Colors.blue,
            unselectedColor: Colors.grey,
          ),
          const       SizedBox(
            height: 30,
          ),
          Container(
            padding:    const EdgeInsets.symmetric(horizontal: 10),
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Hey ${_userData['displayName']}, What is most of your reading for?",
              style: GoogleFonts.roboto(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ListView.builder(
            padding:   const  EdgeInsets.all(10),
            itemExtent: 80.0,
            shrinkWrap: true,
            itemCount: questions.length,
            itemBuilder: (BuildContext context, int index) {
              return Consumer(builder: (context, answersProvider, _) {
                return InkWell(
                    onTap: () {
                      widget.controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      toggleSelection(index);

                    },
                    child: ListItemWidget(
                      img: questions[index].img,
                      title: questions[index].title,
                      isSelected: questions[index].isSelected,
                    ));
              });
            },
          ),
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                SvgPicture.asset(
                  'assets/images/Vector-1.svg',
                  width: MediaQuery.of(context).size.width,
                ),
                SvgPicture.asset(
                  'assets/images/Vector-2.svg',
                  width: MediaQuery.of(context).size.width,
                ),
                SvgPicture.asset(
                  'assets/images/Vector-3.svg',
                  width: MediaQuery.of(context).size.width,
                ),
                SvgPicture.asset(
                  "assets/images/Vector-4.svg",
                  width: MediaQuery.of(context).size.width,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> toggleSelection(int index) async {
    setState(() {
      for (int i = 0; i < questions.length; i++) {
        if (i == index) {
          questions[i].isSelected = true;
        } else {
          questions[i].isSelected = false;
        }
      }
    });

    final selectedAnswer = questions[index].getAnswer();

    String? uid = FirebaseAuth.instance.currentUser?.uid;
    DocumentReference userDocRef = FirebaseFirestore.instance.collection('users').doc(uid);
    await userDocRef.update({'Question 1': selectedAnswer});

  }

}
