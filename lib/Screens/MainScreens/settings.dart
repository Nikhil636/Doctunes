
import 'package:doctunes/Screens/MainScreens/MyFiles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:switcher_button/switcher_button.dart';
import 'Premium_Screen.dart';
import '../../ThemeModel/thememodel.dart';
import 'homepage.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String versionName = "Version 3.0.0";
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyFiles()),
      );
    }
  }

  Color whiteTheme = const Color(0xFFd9d9d9);
  Color darkTheme = const Color(0xFF434853);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(  backgroundColor: themeNotifier.isDark
          ? Colors.black
          : Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height / 20, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width / 48),
                  child: Container(
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
                      trailing: Icon(
                        Icons.abc,
                        color: Colors.transparent,
                        size: MediaQuery.of(context).size.height / 20,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Settings",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize:
                                    MediaQuery.of(context).size.height / 38,
                                letterSpacing: 0.76,
                                color: themeNotifier.isDark
                                    ? Colors.white
                                    : const Color(0xFF222222)),
                          )
                        ],
                      ),
                      leading: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.chevron_left_rounded,
                          size: MediaQuery.of(context).size.height / 30,
                          color: themeNotifier.isDark
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Premium()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.01,
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width / 1.05,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/MyFiles/premium_placeholder.png"),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30, top: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Upgrade Now !",
                                    style: GoogleFonts.roboto(
                                        fontSize:
                                        MediaQuery.of(context).size.height /
                                            31,
                                        letterSpacing: 0.76,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  Text(
                                    "Don't settle for less, upgrade\nto the best with a premium plan!",
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        fontSize:
                                        MediaQuery.of(context).size.height / 64,
                                        letterSpacing: 0.76,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                        color:themeNotifier.isDark
                                            ? const Color(0xFF2F3440)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Icon(
                                            Icons.bolt_rounded,
                                            size: MediaQuery.of(context).size.height/30,
                                            color: themeNotifier.isDark
                                                ? Colors.white
                                                : Colors.blue,
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional.center,
                                          child: Text(
                                            "UPGRADE NOW",
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w800,
                                                fontSize: MediaQuery.of(context).size.height/50,
                                                letterSpacing: 0.76,
                                                color:themeNotifier.isDark
                                                    ? Colors.white
                                                    : Colors.blue),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                                height: 140,
                                width: MediaQuery.of(context).size.width / 3.2,
                                child: SvgPicture.asset(
                                  "assets/MyFiles/Rocket.svg",
                                  fit: BoxFit.fill,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 150,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      8,
                      MediaQuery.of(context).size.height / 200,
                      8,
                      MediaQuery.of(context).size.height / 200),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 14,
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
                            Icons.wallet,
                            size: MediaQuery.of(context).size.height / 28,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 35,
                          ),
                          Text(
                            "Payment & Purchases",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: MediaQuery.of(context).size.height / 48,
                            )),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                surfaceTintColor: Colors.transparent),
                            onPressed: () {},
                            child: Icon(Icons.chevron_right_rounded,
                                color: const Color(0xFF6b6b6b),
                                size: MediaQuery.of(context).size.height / 24),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      8,
                      MediaQuery.of(context).size.height / 200,
                      8,
                      MediaQuery.of(context).size.height / 200),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 14,
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
                            Icons.notifications_none_outlined,
                            size: MediaQuery.of(context).size.height / 28,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 35,
                          ),
                          Text(
                            "Notification",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              // fontSize: 15,
                              fontSize: MediaQuery.of(context).size.height / 48,
                            )),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                surfaceTintColor: Colors.transparent),
                            onPressed: () {},
                            child: Icon(Icons.chevron_right_rounded,
                                color: const Color(0xFF6b6b6b),
                                size: MediaQuery.of(context).size.height / 24),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      8,
                      MediaQuery.of(context).size.height / 200,
                      8,
                      MediaQuery.of(context).size.height / 200),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 14,
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
                            Icons.language_rounded,
                            size: MediaQuery.of(context).size.height / 28,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 35,
                          ),
                          Text(
                            "Language & Voice",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              // fontSize: 15,
                              fontSize: MediaQuery.of(context).size.height / 48,
                            )),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                surfaceTintColor: Colors.transparent),
                            onPressed: () {},
                            child: Icon(Icons.chevron_right_rounded,
                                color: const Color(0xFF6b6b6b),
                                size: MediaQuery.of(context).size.height / 24),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      8,
                      MediaQuery.of(context).size.height / 200,
                      8,
                      MediaQuery.of(context).size.height / 200),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 14,
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
                            themeNotifier.isDark
                                ? Icons.sunny
                                : Icons.dark_mode_rounded,
                            size: MediaQuery.of(context).size.height / 28,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 35,
                          ),
                          Text(
                            "Light Mode",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: MediaQuery.of(context).size.height / 48,
                            )),
                          ),
                          const Spacer(),
                          SwitcherButton(
                            size: MediaQuery.of(context).size.height / 14,
                            value: themeNotifier.isDark ? false : true,
                            onChange: (value) {
                              themeNotifier.isDark
                                  ? themeNotifier.isDark = false
                                  : themeNotifier.isDark = true;
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      8,
                      MediaQuery.of(context).size.height / 200,
                      8,
                      MediaQuery.of(context).size.height / 200),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 14,
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
                            Icons.delete_rounded,
                            size: MediaQuery.of(context).size.height / 28,
                            color: const Color.fromRGBO(255, 0, 0, 1),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 35,
                          ),
                          Text(
                            "Delete Account",
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        MediaQuery.of(context).size.height / 48,
                                    color: const Color(0xFFFF0000))),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                surfaceTintColor: Colors.transparent),
                            onPressed: () {
                              if (kDebugMode) {
                                print("Clicking the delete button");
                              }
                              _showAlertDialog();
                            },
                            child: Icon(Icons.chevron_right_rounded,
                                color: const Color(0xFF6b6b6b),
                                size: MediaQuery.of(context).size.height / 24),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      8,
                      MediaQuery.of(context).size.height / 200,
                      8,
                      MediaQuery.of(context).size.height / 200),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 14,
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
                            Icons.flag_rounded,
                            size: MediaQuery.of(context).size.height / 28,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 35,
                          ),
                          Text("Report a bug",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    MediaQuery.of(context).size.height / 48,
                              ))),
                          const Spacer(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                surfaceTintColor: Colors.transparent),
                            onPressed: () {},
                            child: Icon(Icons.chevron_right_rounded,
                                color: const Color(0xFF6b6b6b),
                                size: MediaQuery.of(context).size.height / 24),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    versionName,
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xFFA7A7A7))),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: MediaQuery.of(context).size.height / 25,
          currentIndex: _selectedIndex,
          unselectedLabelStyle: GoogleFonts.roboto(
              textStyle: TextStyle(
                  // fontSize: 10,
                  fontSize: MediaQuery.of(context).size.height / 85,
                  letterSpacing: 0.76,
                  fontWeight: FontWeight.w700)),
          selectedLabelStyle: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 85,
                  letterSpacing: 0.76,
                  fontWeight: FontWeight.w700)),
          onTap: _onItemTapped,
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.file_copy_sharp),
              label: "My Files",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      );
    });
  }

  // Padding PremiumScreen(ThemeModel themeNotifier) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8),
  //     child: Container(
  //       height: MediaQuery.of(context).size.height / 4,
  //       decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10),
  //           image: const DecorationImage(
  //               fit: BoxFit.cover,
  //               image: AssetImage(
  //                   "assets/MyFiles/premium_placeholder.png"))),
  //       child: Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Row(
  //           children: [
  //             Expanded(
  //               flex: 2,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     children: [
  //                       GestureDetector(
  //                         onTap: () {
  //                           Navigator.push(
  //                               context,
  //                               MaterialPageRoute(
  //                                   builder: (context) =>
  //                                       PremiumScreen(themeNotifier)));
  //                         },
  //                         child: Text("Upgrade Now !",
  //                             style: GoogleFonts.roboto(
  //                                 textStyle: TextStyle(
  //                                     fontWeight: FontWeight.w700,
  //                                     fontSize:
  //                                         MediaQuery.of(context).size.height /
  //                                             30,
  //                                     letterSpacing: 0.76,
  //                                     color: Colors.white))),
  //                       ),
  //                     ],
  //                   ),
  //                   const SizedBox(
  //                     height: 10,
  //                   ),
  //                   Text(
  //                       "Don't settle for less, upgrade to the best with a premium plan!",
  //                       style: GoogleFonts.roboto(
  //                           textStyle: TextStyle(
  //                               color: Colors.white,
  //                               fontWeight: FontWeight.w600,
  //                               fontSize:
  //                                   MediaQuery.of(context).size.height / 60,
  //                               letterSpacing: 0.76))),
  //                   const SizedBox(
  //                     height: 25,
  //                   ),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     children: [
  //                       Container(
  //                         width: 200,
  //                         height: 50,
  //                         decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(12),
  //                             color: themeNotifier.isDark
  //                                 ? const Color(0xFF2F3440)
  //                                 : Colors.white),
  //                         child: Row(
  //                           mainAxisAlignment: MainAxisAlignment.center,
  //                           children: [
  //                             Icon(
  //                               Icons.bolt_rounded,
  //                               color: themeNotifier.isDark
  //                                   ? Colors.white
  //                                   : Colors.blue,
  //                               size: MediaQuery.of(context).size.height/30,
  //                             ),
  //                             SizedBox(
  //                               width: MediaQuery.of(context).size.width/45,
  //                             ),
  //                             Text(
  //                               "UPGRADE NOW",
  //                               style: GoogleFonts.roboto(
  //                                   textStyle: TextStyle(
  //                                 color: themeNotifier.isDark
  //                                     ? Colors.white
  //                                     : Colors.blue,
  //                                 fontWeight: FontWeight.w800,
  //                                 fontSize: MediaQuery.of(context).size.height/50,
  //                                 letterSpacing: 0.76,
  //                               )),
  //                             )
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //                 ],
  //               ),
  //             ),
  //             SvgPicture.asset(
  //               "assets/MyFiles/Rocket.svg",
  //               height: MediaQuery.of(context).size.height/8,
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Future<void> _showAlertDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("What we did wrong"),
            content:  SingleChildScrollView(
              child: ListBody(
                children: [
                  Text('Tell us what we did wrong...'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Delete'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
