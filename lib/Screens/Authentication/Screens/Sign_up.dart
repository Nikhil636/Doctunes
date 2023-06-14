import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctunes/Screens/MainScreens/homepage.dart';
import 'package:doctunes/Useful/Functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../ThemeModel/thememodel.dart';
import '../../Onboarding Screens/Screens/Onboarding Screen.dart';
import 'Login.dart';
import 'User_detail.dart';
FirebaseFirestore firestore = FirebaseFirestore.instance;

class sign_up extends StatefulWidget {
  const sign_up({Key? key}) : super(key: key);

  @override
  State<sign_up> createState() => _sign_upState();
}

class _sign_upState extends State<sign_up> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          body: Stack(
              children: [
            Column(
              children: [
                Expanded(
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      SvgPicture.asset(
                        'assets/AuthBG/Vector5.svg',
                        width: MediaQuery.of(context).size.width,
                      ),
                      SvgPicture.asset(
                        "assets/AuthBG/Vector.svg",
                        width: MediaQuery.of(context).size.width,

                      )
                    ],
                  ),
                ),
                Center(
                    child: Text(
                  "Sign Up!",
                  style:
                      GoogleFonts.roboto(fontSize: MediaQuery.of(context).size.width * 0.125, fontWeight: FontWeight.w700),
                )),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  "Sign up for an aesthetic journey like no other.",
                  style: GoogleFonts.roboto(
                      fontSize:
                      MediaQuery.of(context).size.width * 0.032
                      ,letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                      color: hexStringToColor("#6B6B6B")),
                )),
                const SizedBox(
                  height: 35,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      final googleUser = await _googleSignIn.signIn();
                      final googleAuth = await googleUser?.authentication;
                      final credential = GoogleAuthProvider.credential(
                        accessToken: googleAuth?.accessToken,
                        idToken: googleAuth?.idToken,
                      );
                      final userCredential = await _auth.signInWithCredential(credential);
                      final user = userCredential.user;
                      if (user != null) {
                        final userDocSnapshot = await FirebaseFirestore.instance
                            .collection('users')
                            .doc(user.uid)
                            .get();

                        if (userDocSnapshot.exists) {
                          // Existing user, navigate to the home screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        } else {
                          // New user, store data in Firestore and navigate to the onboarding screen
                          await FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .set({
                            'displayName': user.displayName,
                            'email': user.email,
                            'photoURL': user.photoURL,
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Onboarding_Main()),
                          );
                        }
                      }
                    } catch (e) {
                      print('Sign-in failed: $e');
                    }
                  },

                  child: Container(
                    height: MediaQuery.of(context).size.width/8,
                    width:  MediaQuery.of(context).size.width/1.19,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/google.png",
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          'Continue with Google',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontSize:
                              MediaQuery.of(context).size.width * 0.056
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height:   MediaQuery.of(context).size.width/8,
                    width:MediaQuery.of(context).size.width/1.19,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          Icons.apple,
                          color: Colors.white,
                          size: 29,
                        ),
                        SizedBox(width: 10.0),
                        Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            'Continue with Apple',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize:   MediaQuery.of(context).size.width * 0.056,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const login()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width/8,
                    width: MediaQuery.of(context).size.width/1.19,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Center(
                        child: Text(
                      'Use email instead',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.grey),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account ?",
                      style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const User_Detail()),
                        );
                      },
                      child: Text(
                        "Create",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w600,
                            color: hexStringToColor("#2196F3"),
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                Stack(
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

                    )
                  ],
                ),
              ],
            ),

          ]),
        );
      }
    );
  }
}
