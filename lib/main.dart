import 'package:doctunes/MainScreens/MyFiles.dart';
import 'package:doctunes/MainScreens/Premium_Screen.dart';
import 'package:doctunes/Onboarding%20Screens/Screens/Onboarding%20Screen.dart';
import 'package:doctunes/Onboarding%20Screens/Screens/Ques_4.dart';
import 'package:doctunes/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Authentication/Screens/Sign_up.dart';
import 'Useful/Functions.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => AnswersProvider()),
    //   ],
    //child:
       const MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const sign_up(),
          ),
        );
      }
    });

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Onboarding_Main(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      check();
    });
  }

  void check() async {
    if (FirebaseAuth.instance.currentUser != null) {
      // If yes, then navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const home(),
        ),
      );
    } else {
      // If no, then navigate to the login screen
      navScreen(const sign_up(), context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: const [
                Spacer(),
              Text("Doctunes",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}