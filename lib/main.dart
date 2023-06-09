import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctunes/Screens/MainScreens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Screens/Authentication/Screens/Sign_up.dart';
import 'Screens/Onboarding Screens/Screens/Onboarding Screen.dart';
import 'ThemeModel/thememodel.dart';
import 'Useful/Functions.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer(builder: (context, ThemeModel themeModel, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: themeModel.isDark ? Brightness.dark : Brightness.light,
          ),
          home: Splash(),
        );
      }),
    );
  }
}class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    check();
  }

  void check() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentSnapshot userSnapshot = await firestore
          .collection('users')
          .doc(user.uid)
          .get();

      if (userSnapshot.exists && userSnapshot.data() is Map<String, dynamic>) {
        Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
        if (userData.containsKey('Question 1')) {
          navScreen(const HomePage(), context, true);
        } else {
          navScreen(const Onboarding_Main(), context, true);
        }
      } else {
        navScreen(const sign_up(), context, true);
      }
    } else {
      navScreen(const sign_up(), context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Doctunes",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 30,),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
