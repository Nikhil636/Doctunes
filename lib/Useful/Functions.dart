import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Onboarding Screens/Screens/Onboarding Screen.dart';



class UserDataFetcher {
  static Future<Map<String, dynamic>> fetchUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();
      return snapshot.data() as Map<String, dynamic>;
    }
    return {};
  }
}



toaster(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      backgroundColor: Colors.grey);
}

void Snacker(String title, GlobalKey<ScaffoldMessengerState> aa) {
  final snackBar = SnackBar(
      elevation: 0,
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.grey,
      content: Text(title));

  aa.currentState?.showSnackBar(snackBar);
}

checker(BuildContext c) async {
  User? user = await FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  QuerySnapshot querySnapshot = await firestore
      .collection('Users')
      .where("uid", isEqualTo: user!.uid)
      .get();

  if (querySnapshot != null) {
    final allData = querySnapshot.docs.map((e) => e.data()).toList();
    if (allData.length != 0) {
      var b = allData[0] as Map<String, dynamic>;
      Navigator.of(c).pushAndRemoveUntil(
          MaterialPageRoute(builder: (c) => Onboarding_Main()),
              (Route<dynamic> route) => false);
    }
  }
}

navScreen(Widget a, BuildContext context, bool replace) {
  if (replace) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return a;
    }));
  } else {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return a;
    }));
  }
}

Color hexStringToColor(String hexColor, {double opacity = 1.0}) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  final color = Color(int.parse(hexColor, radix: 16));
  return color.withOpacity(opacity);
}



