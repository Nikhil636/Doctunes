import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctunes/Screens/MainScreens/AudioSelect.dart';
import 'package:doctunes/Screens/MainScreens/Folder.dart';
import 'package:doctunes/Screens/MainScreens/MyFiles.dart';
import 'package:doctunes/Screens/MainScreens/Premium_Screen.dart';
import 'package:doctunes/Screens/MainScreens/homepage.dart';
import 'package:doctunes/Screens/MainScreens/profile.dart';
import 'package:doctunes/Screens/MainScreens/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Screens/Authentication/Screens/Sign_up.dart';
import 'ThemeModel/thememodel.dart';
import 'Useful/Functions.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
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

    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(builder: (context, ThemeModel themeModel, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              brightness:
              themeModel.isDark ? Brightness.dark : Brightness.light),
          home: const HomePage(),
        );
      }),
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
          builder: (BuildContext context) => const HomePage(),
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