import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Useful/Functions.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

bool passwordVisible = true;

class _loginState extends State<login> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String email = "";
  String password = "";
  final formkey = GlobalKey<FormState>();
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  bool isHide = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messangerKey,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Form(
            key: formkey,
            child: Column(
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
                Text(
                  "Log In!",
                  style: GoogleFonts.roboto(fontSize: MediaQuery.of(context).size.width * 0.125, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Login to a world of seamless experience.",
                  style: GoogleFonts.roboto(fontSize: MediaQuery.of(context).size.width * 0.032, fontWeight: FontWeight.w600,color: hexStringToColor("#6B6B6B")),
                ),
                const  SizedBox(
                  height: 35,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width/8,
                  width: MediaQuery.of(context).size.width / 1.08,
                  child: TextFormField(
                    controller: idController,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    cursorColor: Colors.black,
                    style: GoogleFonts.roboto(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      labelText: "EMAIL ADDRESS",
                      labelStyle: GoogleFonts.roboto(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:  const BorderSide(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Colors.blue)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                          )),
                    ),
                    onChanged: (text) {
                    email = text;
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
                const    SizedBox(
                  height: 18,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width/8,
                  width: MediaQuery.of(context).size.width / 1.08,
                  child: TextFormField
                    (
                    controller: passController,
                    autofocus: false,
                    cursorColor: Colors.black,
                    obscureText: !passwordVisible,
                    enableSuggestions: false,
                    autocorrect: false,
                    style:GoogleFonts.roboto(
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
                      labelText: "PASSWORD",
                      labelStyle: GoogleFonts.roboto(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              width: 1,
                              style: BorderStyle.solid,
                              color: Colors.blue)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                          )),
                    ), onChanged: (text) {
                    password = text;
                  },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please enter a password");
                      } else if (value.length < 6) {
                        return ("The Password length must be more than 6 characters");
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      alignment: AlignmentDirectional.centerEnd,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "Forgot password?",
                          style: GoogleFonts.roboto(
                              color: hexStringToColor("#6B6B6B"), fontSize:  MediaQuery.of(context).size.width * 0.03,fontWeight: FontWeight.w500),
                        ),
                      ),
                    )),
                const    SizedBox(height: 15),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width/8,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: hexStringToColor("#2196F3"),
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )),
                      onPressed: () {
                       // login(context);
                      },
                      child:  Text(
                        "LOGIN",style: GoogleFonts.roboto(fontSize: MediaQuery.of(context).size.width * 0.05,fontWeight: FontWeight.w500),
                      )),
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
          ),
        ]),
      ),
    );
  }

  // login(BuildContext context) async {
  //   if (formkey.currentState!.validate()) {
  //     setState(() {
  //       isHide = true;
  //     });
  //     try {
  //       await _auth
  //           .signInWithEmailAndPassword(email: email, password: password)
  //           .then((uid) => {
  //         checker(context),
  //         print('ho gya'),
  //         setState(() {
  //         }),
  //       });
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == "user-not-found") {
  //         setState(() {
  //           isHide = false;
  //         });
  //         Snacker("User not Found", _messangerKey);
  //       } else if (e.code == "wrong_password") {
  //         setState(() {
  //           isHide = false;
  //         });
  //         Snacker("Wrong Password", _messangerKey);
  //         print('hello');
  //       } else {
  //         setState(() {
  //           isHide = false;
  //         });
  //         Snacker("Something went wrong", _messangerKey);
  //         print('hello');
  //       }
  //     }
  //   }
  // }
}


