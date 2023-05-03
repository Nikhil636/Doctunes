import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctunes/Authentication/Screens/Login.dart';
import 'package:doctunes/Authentication/Screens/User_detail.dart';
import 'package:doctunes/Onboarding%20Screens/Screens/Onboarding%20Screen.dart';
import 'package:doctunes/Useful/Functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  SvgPicture.asset(
                    'assets/images/Vector5.svg',
                    width: MediaQuery.of(context).size.width,
                  ),
                  SvgPicture.asset(
                    "assets/images/Vector.svg",
                    width: MediaQuery.of(context).size.width,
                  )
                ],
              ),
            ),
            Center(
                child: Text(
              "Sign Up!",
              style: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w700),
            )),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "Sign up for an aesthetic journey like no other.",
              style: GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w600,color: hexStringToColor("#6B6B6B")),
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
                } catch (e) {
                  print('Sign-in failed: $e');
                }
              },
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(13.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/search.png",
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      'Continue with Google',
                      style:
                          GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 23),
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
                height: 50,
                width: 350,
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
                      size: 25,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      'Continue with Apple',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 23,
                          color: Colors.white),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const User_Detail()));
              },
              child: Container(
                height: 50,
                width: 350,
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
                  "Already have an account ?",
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const login()),
                    );
                  },
                  child: Text(
                    "Login",
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
          ],
        ),
      ]),
    );
  }
}
