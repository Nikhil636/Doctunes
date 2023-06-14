import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctunes/Screens/Authentication/Screens/Sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Useful/Functions.dart';
import 'Login.dart';

final _messangerKey = GlobalKey<ScaffoldMessengerState>();

class User_Detail extends StatefulWidget {
  const User_Detail({Key? key}) : super(key: key);

  @override
  State<User_Detail> createState() => _User_DetailState();
}
class _User_DetailState extends State<User_Detail> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController usnameController = TextEditingController();
  bool passwordVisible = true;
  String email = "";
  String fullname = " ";
  String password = "";
  FirebaseAuth _auth = FirebaseAuth.instance;
  final formkey = GlobalKey<FormState>();
  bool isHide = false;
  @override
  void initState() {
    passwordVisible = !passwordVisible;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Expanded(
              child: Stack(
               alignment: AlignmentDirectional.topStart,
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
            Text(
              "Register",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Text(
              "Register your email with us",
              style: TextStyle(fontSize:
              MediaQuery.of(context).size.width * 0.032
              ,letterSpacing: 1.5,
              fontWeight: FontWeight.w600,
              color: hexStringToColor("#6B6B6B")),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.08,
              child: TextFormField(
                controller: usnameController,
                key: ValueKey('fullname'),
                keyboardType: TextInputType.name,
                autofocus: false,
                cursorColor: Colors.black,
                style: TextStyle(
                  fontFamily: 'mons',
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "USERNAME",
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                      )),
                ),
                onSaved: (value) {
                  setState(() {
                    fullname = value!;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please enter User name");
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.08,
              child: TextFormField(
                controller: idController,
                key: ValueKey('email'),
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                cursorColor: Colors.black,
                style: TextStyle(
                  fontFamily: 'mons',
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "EMAIL ADDRESS",
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                      )),
                ),
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
                validator: (value) {
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);
                  if (!emailValid) {
                    return ("Please enter a valid email");
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width / 1.08,
              child: TextFormField(
                key: ValueKey('password'),
                controller: passController,
                autofocus: false,
                cursorColor: Colors.black,
                obscureText: !passwordVisible,
                enableSuggestions: false,
                autocorrect: false,
                style: TextStyle(
                  fontFamily: 'mons',
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  hintText: "PASSWORD",
                  hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.blue)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                      )),
                ),
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("Please enter a password");
                  } else if (value.length < 6) {
                    return ("The Password length must be more than 6 characters");
                  }
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue.shade400,
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      finalSignUp(context);
                    }
                  },
                  child: Text(
                    "Register",
                  )),
            ),
            SizedBox(
              height: 15,
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
                      MaterialPageRoute(
                          builder: (context) => const sign_up()),
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
      ),
    );
  }

  Future<void> finalSignUp(BuildContext context) async {
    setState(() {
      isHide = true;
    });

    // Validate the email format
    if (!_isEmailValid(email)) {
      setState(() {
        isHide = false;
      });
      showSnackBar("Invalid Email Format");
      return;
    }

    try {
      // Verify if the email is valid
      final emailExists = await _verifyEmailExists(email);

      if (emailExists) {
        setState(() {
          isHide = false;
        });
        showSnackBar("User Already Exists");
      } else {
        await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
          final user = _auth.currentUser;

          if (user != null) {
            await user.sendEmailVerification();
            print("Verification email sent");
          }

          postDetailsToFirestore();
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isHide = false;
      });
      showSnackBar("Something Went Wrong");
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
    return emailRegex.hasMatch(email);
  }

  Future<bool> _verifyEmailExists(String email) async {
    try {
      final methods = await _auth.fetchSignInMethodsForEmail(email);
      return methods.isNotEmpty;
    } catch (e) {
      print('Error verifying email: $e');
      return false;
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    Map<String, String> item = {
      "displayName": fullname,
      "email": email,
    };

    await firestore.collection("users").doc(user?.uid).set(item);
    setState(() {
      isHide = false;
    });
    toaster("User created Successfully");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const login()),
    );
  }
}
