import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Useful/Functions.dart';
import 'Login.dart';

final _messangerKey = GlobalKey<ScaffoldMessengerState>();

class User_Detail extends StatefulWidget {
  const User_Detail({Key? key}) : super(key: key);

  @override
  State<User_Detail> createState() => _User_DetailState();
}
TextEditingController idController = TextEditingController();
TextEditingController passController = TextEditingController();
TextEditingController usnameController = TextEditingController();
bool passwordVisible = true;
String email = "";
String fullname = " ";
String password = "";
FirebaseAuth _auth = FirebaseAuth.instance;
final formkey = GlobalKey<FormState>();

class _User_DetailState extends State<User_Detail> {

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
        child: Stack(children: [
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
                "Register",
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "Register your email with us",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
              )),
              SizedBox(
                height: 35,
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
                    labelText: "USERNAME",
                    labelStyle: TextStyle(
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
                height: 20,
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
                    labelText: "EMAIL ADDRESS",
                    labelStyle: TextStyle(
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
                height: 18,
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
                    labelText: "PASSWORD",
                    labelStyle: TextStyle(
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
                height: 20,
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
                         FinalSignUp(context);
                      }

                    },
                    child: Text(
                      "Register",
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
        ]),
      ),
    );
  }

  FinalSignUp(BuildContext context) async {
    setState(() {
      isHide = true;
    });
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                print("blueee" + value.toString()),
                postDetailsTofirestore(),
              });
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        setState(() {
          isHide = false;
          Snacker("User Already Exists", _messangerKey);
        });
      } else {
        isHide = false;
        Snacker("Something Went Wrong", _messangerKey);
      }
    }
  }

  postDetailsTofirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    Map<String, String> item = {
      "name": fullname,
      "email": email,
      "uid": user!.uid,
    };

    await firestore.collection("Users").doc(user.uid).set(item);
    setState(() {
      isHide = false;
    });
    toaster("User created Succesfully");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const login()));
  }
}
