import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../ThemeModel/thememodel.dart';
import '../../Useful/Functions.dart';
import '../Authentication/Screens/Sign_up.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  void signOutGoogle(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      await googleSignIn.signOut();
      print("User signed out");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => sign_up(),
        ),
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }
  ImagePicker? picker;

  File? _image;
  Map<String, dynamic> _userData = {};

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    Map<String, dynamic> userData = await UserDataFetcher.fetchUserData();
    setState(() {
      _userData = userData;
    });
  }

  Future? _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Navigator.pop(context);
    }
  }

  Color whiteTheme = const Color(0xFFd9d9d9);
  Color darkTheme = const Color(0xFF434853);
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor: themeNotifier.isDark ? Colors.black : Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(
                4, MediaQuery.of(context).size.height / 20, 4, 0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: GradientBoxBorder(
                          gradient: LinearGradient(colors: [
                        themeNotifier.isDark
                            ? const Color(0xFF3c72e9)
                            : const Color(0xFFe3e3e3),
                        themeNotifier.isDark
                            ? const Color(0xFF9c9c9c)
                            : const Color(0xFFe3e3e3)
                      ]))),
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        themeNotifier.isDark
                            ? themeNotifier.isDark = false
                            : themeNotifier.isDark = true;
                      },
                      icon: Icon(
                        themeNotifier.isDark
                            ? Icons.sunny
                            : Icons.dark_mode_rounded,
                        size: MediaQuery.of(context).size.height / 28,
                      ),
                    ),
                    title: Center(
                        child: Text(
                      "Profile",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height / 36,
                          letterSpacing: 0.76,
                          color: themeNotifier.isDark
                              ? Colors.white
                              : const Color(0xFF222222)),
                    )),
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.chevron_left_rounded,
                        size: MediaQuery.of(context).size.height / 32,
                        color:
                            themeNotifier.isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: MediaQuery.of(context).size.width / 2.8,
                  width: MediaQuery.of(context).size.width / 2.8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: AlignmentDirectional.topCenter,
                          end: AlignmentDirectional.bottomCenter,
                          colors: [
                            hexStringToColor('#79D0E5'),
                            hexStringToColor('#C3CED0')
                          ])),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.width / 3.1,
                          width: MediaQuery.of(context).size.width / 3.1,
                          child: _image == null
                              ? CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.height / 35,
                                  backgroundImage: const NetworkImage(
                                      'https://images.pexels.com/photos/4307869/pexels-photo-4307869.jpeg?auto=compress&cs=tinysrgb&w=600'),
                                )
                              : CircleAvatar(
                                  backgroundImage: FileImage(_image!),
                                  radius:
                                      MediaQuery.of(context).size.height / 35,
                                ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.width / 3.1,
                          width: MediaQuery.of(context).size.width / 3.1,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  begin: AlignmentDirectional.topCenter,
                                  end: AlignmentDirectional.bottomCenter,
                                  colors: [
                                    hexStringToColor('#000000').withOpacity(0),
                                    hexStringToColor('#000000')
                                        .withOpacity(0.2),
                                    hexStringToColor('#2196F3').withOpacity(0.9)
                                  ])),
                        ),
                      ),
                      Positioned(
                        bottom: 6,
                        right: 0,
                        left: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width / 9,
                          height: MediaQuery.of(context).size.height / 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          child: GestureDetector(
                            onTap: () {
                              _pickImage(ImageSource.gallery);
                            },
                            child: Icon(
                              Icons.mode_edit_outline_outlined,
                              color: Colors.white,
                              size: MediaQuery.of(context).size.height / 28,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 70,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height / 100),
                    child: Container(
                      decoration: BoxDecoration(
                        color: themeNotifier.isDark ? darkTheme : whiteTheme,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height / 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person,
                              size: MediaQuery.of(context).size.height / 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 38,
                            ),
                            Text(
                              '${_userData['displayName']}wdwd'
                                  '',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                    MediaQuery.of(context).size.height / 44,
                                  )),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  surfaceTintColor: Colors.transparent),
                              onPressed: () {},
                              child: Icon(
                                Icons.edit,
                                color: const Color(0xFF6b6b6b),
                                size: MediaQuery.of(context).size.height / 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height / 100),
                    child: Container(
                      decoration: BoxDecoration(
                        color: themeNotifier.isDark ? darkTheme : whiteTheme,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height / 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              size: MediaQuery.of(context).size.height / 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 38,
                            ),
                            Text(
                              "Rate Us",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    MediaQuery.of(context).size.height / 44,
                              )),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  surfaceTintColor: Colors.transparent),
                              onPressed: () {},
                              child: Icon(
                                Icons.chevron_right_rounded,
                                color: const Color(0xFF6b6b6b),
                                size: MediaQuery.of(context).size.height / 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height / 100),
                    child: Container(
                      decoration: BoxDecoration(
                        color: themeNotifier.isDark ? darkTheme : whiteTheme,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height / 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.file_copy_rounded,
                              size: MediaQuery.of(context).size.height / 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 38,
                            ),
                            Text(
                              "Terms & Conditions",
                              style: GoogleFonts.roboto(
                                  textStyle: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    MediaQuery.of(context).size.height / 44,
                              ))),
                            ),
                            const Spacer(),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                    surfaceTintColor: Colors.transparent),
                                onPressed: () {},
                                child: Icon(
                                  Icons.chevron_right_rounded,
                                  color: const Color(0xFF6b6b6b),
                                  size: MediaQuery.of(context).size.height / 25,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                  child: Padding(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height / 100),
                    child: Container(
                      decoration: BoxDecoration(
                        color: themeNotifier.isDark ? darkTheme : whiteTheme,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.height / 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.support_agent_rounded,
                              size: MediaQuery.of(context).size.height / 30,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 38,
                            ),
                            Text(
                              "Help Center",
                              style: GoogleFonts.roboto(
                                textStyle: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  // fontSize: 15,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 44,
                                )),
                              ),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  surfaceTintColor: Colors.transparent),
                              onPressed: () {},
                              child: Icon(
                                Icons.chevron_right_rounded,
                                color: const Color(0xFF6b6b6b),
                                size: MediaQuery.of(context).size.height / 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    signOutGoogle(context);
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.height / 100),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 15,
                        decoration: BoxDecoration(
                          color: themeNotifier.isDark ? darkTheme : whiteTheme,
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height / 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.exit_to_app_rounded,
                                size: MediaQuery.of(context).size.height / 30,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 38,
                              ),
                              Text(
                                "Sign Out",
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w400,
                                  fontSize:
                                      MediaQuery.of(context).size.height / 44,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    Text(
                      "Join us in social media",
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.height / 44,
                              color: themeNotifier.isDark
                                  ? Colors.white
                                  : Colors.black)),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 18,
                          width: MediaQuery.of(context).size.height / 18,
                          child: SvgPicture.asset(
                            "assets/ProfilePage/Facebook.svg",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 18,
                          width: MediaQuery.of(context).size.height / 18,
                          child: SvgPicture.asset(
                            "assets/ProfilePage/LinkedIn.svg",
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 18,
                          width: MediaQuery.of(context).size.height / 18,
                          child: SvgPicture.asset(
                            "assets/ProfilePage/Instagram.svg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
