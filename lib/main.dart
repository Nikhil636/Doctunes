import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctunes/Screens/Authentication/Screens/Login.dart';
import 'package:doctunes/Screens/Authentication/Screens/User_detail.dart';
import 'package:doctunes/Screens/MainScreens/FAQ.dart';
import 'package:doctunes/Screens/MainScreens/Folder.dart';
import 'package:doctunes/Screens/MainScreens/homepage.dart';
import 'package:doctunes/Screens/MainScreens/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Screens/Authentication/Screens/Sign_up.dart';
import 'Screens/MainScreens/profile.dart';
import 'Screens/Onboarding Screens/Screens/Onboarding Screen.dart';
import 'ThemeModel/thememodel.dart';
import 'Useful/Functions.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(builder: (context, ThemeModel themeModel, child) {
        final isDarkMode = themeModel.isDark;
        final statusBarColor = isDarkMode ? Colors.black : Colors.white;
        final statusBarIconBrightness =
        isDarkMode ? Brightness.light : Brightness.dark;

        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: statusBarColor,
            statusBarBrightness: statusBarIconBrightness,
            statusBarIconBrightness: statusBarIconBrightness,
          ),
        );
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: themeModel.isDark ? Brightness.dark : Brightness.light,
            primaryColor: themeModel.isDark ? Colors.black : Colors.white, // Update primary color
          ),
          home: Builder(builder: (context){

            final currentTheme = Theme.of(context);
            final currentPrimaryColor = currentTheme.primaryColor;

            // Update status bar color dynamically
            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(
                statusBarColor: currentPrimaryColor,
                statusBarBrightness: statusBarIconBrightness,
                statusBarIconBrightness: statusBarIconBrightness,
              ),
            );

            return Splash();


          }),
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
  void check() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        firestore.collection('users').doc(user.uid).get().then((DocumentSnapshot userSnapshot) {
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
        });
      } else {
        navScreen(const sign_up(), context, true);
      }
    });
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
