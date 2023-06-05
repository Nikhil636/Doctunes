import 'package:doctunes/Screens/MainScreens/MyFiles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';

import 'profile.dart';
import 'settings.dart';
import '../../ThemeModel/thememodel.dart';
import '../../Useful/Functions.dart';
import '../../Useful/Model.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({Key? key}) : super(key: key);

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  int Selected = 1;
  bool isSelected = false;
  int SelectedIndex = -1;
  int FolderSelect = -1;
  List<String> folderNames = [];
  List<FilesModel> Files = [
    FilesModel("Doctunes origin.jpg", "2023-01-13 - 12:05",
        "assets/File Type/Image.png"),
    FilesModel("The Amazon Rainforest tropical...", "2023-01-13 - 10:15",
        "assets/File Type/Image.png"),
    FilesModel("The Layers of the Earth's Atmos...", "2023-01-11 - 10:00",
        "assets/File Type/Txt.png"),
    FilesModel("Mesozoic Life: Evolution and Di...", "2023-01-11 - 10:00",
        "assets/File Type/Txt.png"),
    FilesModel("Doctunes origin.jpg", "2023-01-13 - 12:05",
        "assets/File Type/Image.png"),
  ];
  Color whiteTheme = const Color(0xFFd9d9d9);
  Color darkTheme = const Color(0xFF434853);
  @override
  Widget build(BuildContext context) {
    if (folderNames.isEmpty) {
      return Consumer(builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(  backgroundColor: themeNotifier.isDark
            ? Colors.black
            : Colors.white,
            body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    16,0, 16, 0),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 13,
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
                            leading: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Profilepage()));
                              },
                              child: CircleAvatar(
                                radius: MediaQuery.of(context).size.height / 40,
                                backgroundImage: const NetworkImage(
                                    "https://images.pexels.com/photos/1214205/pexels-photo-1214205.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                              ),
                            ),
                            title: TextFormField(
                              showCursor: true,
                              cursorColor: themeNotifier.isDark
                                  ? Colors.white
                                  : Colors.black,
                              style: GoogleFonts.roboto(
                                fontSize: 15.0,
                                color: themeNotifier.isDark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: "Search library",
                                suffixIcon: const Icon(
                                  Icons.search_rounded,
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            trailing: PopupMenuButton(
                              offset: Offset(MediaQuery.of(context).size.width, 0),
                              position: PopupMenuPosition.under,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.elliptical(10, 15),
                                ),
                              ),
                              icon: Icon(
                                Icons.menu,
                                size: MediaQuery.of(context).size.height / 30,
                                color: themeNotifier.isDark
                                    ? const Color(0xFFdfdfdf)
                                    : const Color(0xFF222222),
                              ),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  height: MediaQuery.of(context).size.height / 16,
                                  value: 1,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: MediaQuery.of(context).size.height / 30,
                                        color: Colors.amber,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width / 20,
                                      ),
                                      Text(
                                        "Rate Us",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                            MediaQuery.of(context).size.height /
                                                45,
                                            color: themeNotifier.isDark
                                                ? const Color(0xFFFFFFFF)
                                                : const Color(0xFF222222)),
                                      )
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  height: MediaQuery.of(context).size.height / 16,
                                  value: 2,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.dark_mode_rounded,
                                        size: MediaQuery.of(context).size.height / 30,
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width / 20,
                                      ),
                                      Text("Theme",
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w400,
                                              fontSize:
                                              MediaQuery.of(context).size.height /
                                                  45,
                                              color: themeNotifier.isDark
                                                  ? const Color(0xFFFFFFFF)
                                                  : const Color(0xFF222222)))
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  height: MediaQuery.of(context).size.height / 20,
                                  value: 3,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.diamond,
                                        size: MediaQuery.of(context).size.height / 30,
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width / 20,
                                      ),
                                      Text(
                                        "Purchases",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                            MediaQuery.of(context).size.height /
                                                45,
                                            color: themeNotifier.isDark
                                                ? const Color(0xFFFFFFFF)
                                                : const Color(0xFF222222)),
                                      )
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  height: MediaQuery.of(context).size.height / 16,
                                  value: 4,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.contact_mail_rounded,
                                        size: MediaQuery.of(context).size.height / 30,
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width / 20,
                                      ),
                                      Text(
                                        "Contact Us",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                            MediaQuery.of(context).size.height /
                                                45,
                                            color: themeNotifier.isDark
                                                ? const Color(0xFFFFFFFF)
                                                : const Color(0xFF222222)),
                                      )
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  height: MediaQuery.of(context).size.height / 16,
                                  value: 5,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.feedback_outlined,
                                        size: MediaQuery.of(context).size.height / 30,
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width / 20,
                                      ),
                                      Text(
                                        "Feedback",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                            MediaQuery.of(context).size.height /
                                                45,
                                            color: themeNotifier.isDark
                                                ? const Color(0xFFFFFFFF)
                                                : const Color(0xFF222222)),
                                      )
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  height: MediaQuery.of(context).size.height / 16,
                                  value: 6,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.exit_to_app,
                                        size: MediaQuery.of(context).size.height / 30,
                                        color: const Color(0xFFFF0000),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width / 20,
                                      ),
                                      Text(
                                        "Logout",
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                            MediaQuery.of(context).size.height /
                                                45,
                                            color: const Color(0xFFFF0000)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                              elevation: 2,
                              onSelected: (value) {
                                if (value == 2) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                          const SettingsPage()));
                                }
                              },
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: [
                    Hero(
                      tag: 'tag-2',
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Selected = 0;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyFiles()));
                        },
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text("Recently Added",
                              style: GoogleFonts.roboto(
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: themeNotifier.isDark && Selected == 0
                                    ? hexStringToColor("#2196F3")
                                    : !themeNotifier.isDark && Selected == 0
                                        ? hexStringToColor("#2196F3")
                                        : themeNotifier.isDark
                                            ? hexStringToColor('#6B6B6B')
                                            : Colors.black,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 8,
                    ),
                    Hero(
                      tag: 'tag-1',
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Selected = 1;
                          });
                        },
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            "Folder",
                            style: GoogleFonts.roboto(
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: themeNotifier.isDark && Selected == 1
                                  ? hexStringToColor("#2196F3")
                                  : !themeNotifier.isDark && Selected == 1
                                      ? hexStringToColor("#2196F3")
                                      : themeNotifier.isDark
                                          ? hexStringToColor('#6B6B6B')
                                          : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          String folderName = '';
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            contentPadding:
                                EdgeInsets.fromLTRB(24.0, 24, 24.0, 0.0),
                            title: Center(child: Text('Create Folder')),
                            content: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Enter folder name',
                                    style: GoogleFonts.roboto(
                                      color: themeNotifier.isDark ? Colors.white : Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 23),
                                  SizedBox(
                                    height: 50,
                                    child: TextField(
                                      onChanged: (value) {
                                        folderName = value;
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              Container(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                                width: 0.35,
                                                color: themeNotifier.isDark
                                                    ? Colors.white
                                                    : Colors.black),
                                            top: BorderSide(
                                                width: 0.7,
                                                color: themeNotifier.isDark
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: themeNotifier.isDark
                                                  ? Colors.white
                                                  : Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                                width: 0.7,
                                                color: themeNotifier.isDark
                                                    ? Colors.white
                                                    : Colors.black),
                                            left: BorderSide(
                                                width: 0.35,
                                                color: themeNotifier.isDark
                                                    ? Colors.white
                                                    : Colors.black),
                                          ),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(folderName);
                                          },
                                          child: Text(
                                            'OK',
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ).then((value) {
                        if (value != null && value.isNotEmpty) {
                          setState(() {
                            folderNames.add(value);
                          });
                        }
                      });
                    },
                    child: Image(
                      image: AssetImage("assets/MyFiles/NewFolder.png"),
                      color: themeNotifier.isDark ? Colors.white : Colors.black,
                    ),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Tap on the icon to create a folder",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        wordSpacing: 1,
                        fontSize: 23),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 150,
                  //   child: ListView.builder(
                  //     itemCount: folderNames.length,
                  //     itemBuilder: (context, index) {
                  //       return GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             FolderSelect = index; // update the selected index
                  //           });
                  //         },
                  //         child: Container(
                  //           color: index == FolderSelect
                  //               ? hexStringToColor("#BBDEFA")
                  //               : Colors.white,
                  //           child: ListTile(
                  //             leading: Image(
                  //               image: AssetImage("assets/images/Folder.png"),
                  //               fit: BoxFit.fill,
                  //             ),
                  //             title: Text(folderNames[index]),
                  //             subtitle: Text("10 items | Mar 14"),
                  //             trailing: Icon(Icons.keyboard_arrow_right),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // )
                ],
              )),
            ],
          ),
        ));
      });
    } else {
      return Consumer(builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
            backgroundColor: themeNotifier.isDark
                ? Colors.black
                : Colors.white,
            body: FolderSelect == -1
                ? SafeArea(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              16,0, 16, 0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height / 13,
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
                                      leading: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => const Profilepage()));
                                        },
                                        child: CircleAvatar(
                                          radius: MediaQuery.of(context).size.height / 40,
                                          backgroundImage: const NetworkImage(
                                              "https://images.pexels.com/photos/1214205/pexels-photo-1214205.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                                        ),
                                      ),
                                      title: TextFormField(
                                        showCursor: true,
                                        cursorColor: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                        style: GoogleFonts.roboto(
                                          fontSize: 15.0,
                                          color: themeNotifier.isDark
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Search library",
                                          suffixIcon: const Icon(
                                            Icons.search_rounded,
                                            color: Colors.black,
                                          ),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                      trailing: PopupMenuButton(
                                        offset: Offset(MediaQuery.of(context).size.width, 0),
                                        position: PopupMenuPosition.under,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.elliptical(10, 15),
                                          ),
                                        ),
                                        icon: Icon(
                                          Icons.menu,
                                          size: MediaQuery.of(context).size.height / 30,
                                          color: themeNotifier.isDark
                                              ? const Color(0xFFdfdfdf)
                                              : const Color(0xFF222222),
                                        ),
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            height: MediaQuery.of(context).size.height / 16,
                                            value: 1,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  size: MediaQuery.of(context).size.height / 30,
                                                  color: Colors.amber,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width / 20,
                                                ),
                                                Text(
                                                  "Rate Us",
                                                  style: GoogleFonts.roboto(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize:
                                                      MediaQuery.of(context).size.height /
                                                          45,
                                                      color: themeNotifier.isDark
                                                          ? const Color(0xFFFFFFFF)
                                                          : const Color(0xFF222222)),
                                                )
                                              ],
                                            ),
                                          ),
                                          PopupMenuItem(
                                            height: MediaQuery.of(context).size.height / 16,
                                            value: 2,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.dark_mode_rounded,
                                                  size: MediaQuery.of(context).size.height / 30,
                                                  color: themeNotifier.isDark
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width / 20,
                                                ),
                                                Text("Theme",
                                                    style: GoogleFonts.roboto(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize:
                                                        MediaQuery.of(context).size.height /
                                                            45,
                                                        color: themeNotifier.isDark
                                                            ? const Color(0xFFFFFFFF)
                                                            : const Color(0xFF222222)))
                                              ],
                                            ),
                                          ),
                                          PopupMenuItem(
                                            height: MediaQuery.of(context).size.height / 20,
                                            value: 3,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.diamond,
                                                  size: MediaQuery.of(context).size.height / 30,
                                                  color: themeNotifier.isDark
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width / 20,
                                                ),
                                                Text(
                                                  "Purchases",
                                                  style: GoogleFonts.roboto(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize:
                                                      MediaQuery.of(context).size.height /
                                                          45,
                                                      color: themeNotifier.isDark
                                                          ? const Color(0xFFFFFFFF)
                                                          : const Color(0xFF222222)),
                                                )
                                              ],
                                            ),
                                          ),
                                          PopupMenuItem(
                                            height: MediaQuery.of(context).size.height / 16,
                                            value: 4,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.contact_mail_rounded,
                                                  size: MediaQuery.of(context).size.height / 30,
                                                  color: themeNotifier.isDark
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width / 20,
                                                ),
                                                Text(
                                                  "Contact Us",
                                                  style: GoogleFonts.roboto(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize:
                                                      MediaQuery.of(context).size.height /
                                                          45,
                                                      color: themeNotifier.isDark
                                                          ? const Color(0xFFFFFFFF)
                                                          : const Color(0xFF222222)),
                                                )
                                              ],
                                            ),
                                          ),
                                          PopupMenuItem(
                                            height: MediaQuery.of(context).size.height / 16,
                                            value: 5,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.feedback_outlined,
                                                  size: MediaQuery.of(context).size.height / 30,
                                                  color: themeNotifier.isDark
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width / 20,
                                                ),
                                                Text(
                                                  "Feedback",
                                                  style: GoogleFonts.roboto(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize:
                                                      MediaQuery.of(context).size.height /
                                                          45,
                                                      color: themeNotifier.isDark
                                                          ? const Color(0xFFFFFFFF)
                                                          : const Color(0xFF222222)),
                                                )
                                              ],
                                            ),
                                          ),
                                          PopupMenuItem(
                                            height: MediaQuery.of(context).size.height / 16,
                                            value: 6,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.exit_to_app,
                                                  size: MediaQuery.of(context).size.height / 30,
                                                  color: const Color(0xFFFF0000),
                                                ),
                                                SizedBox(
                                                  width: MediaQuery.of(context).size.width / 20,
                                                ),
                                                Text(
                                                  "Logout",
                                                  style: GoogleFonts.roboto(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize:
                                                      MediaQuery.of(context).size.height /
                                                          45,
                                                      color: const Color(0xFFFF0000)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                        elevation: 2,
                                        onSelected: (value) {
                                          if (value == 2) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                    const SettingsPage()));
                                          }
                                        },
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            children: [
                              Hero(
                                tag: 'tag-2',
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Selected = 0;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyFiles()));
                                  },
                                  child: Text("Recently Added",
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: themeNotifier.isDark &&
                                                Selected == 0
                                            ? hexStringToColor("#2196F3")
                                            : !themeNotifier.isDark &&
                                                    Selected == 0
                                                ? hexStringToColor("#2196F3")
                                                : themeNotifier.isDark
                                                    ? hexStringToColor(
                                                        '#6B6B6B')
                                                    : Colors.black,
                                      )),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 8,
                              ),
                              Hero(
                                tag: 'tag-1',
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      Selected = 1;
                                    });
                                  },
                                  child: Text(
                                    "Folder",
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: themeNotifier.isDark &&
                                              Selected == 1
                                          ? hexStringToColor("#2196F3")
                                          : !themeNotifier.isDark &&
                                                  Selected == 1
                                              ? hexStringToColor("#2196F3")
                                              : themeNotifier.isDark
                                                  ? hexStringToColor('#6B6B6B')
                                                  : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      String folderName = '';
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        contentPadding: EdgeInsets.fromLTRB(
                                            24.0, 24, 24.0, 0.0),
                                        title: Center(
                                            child: Text('Create Folder')),
                                        content: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.15,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                'Enter folder name',
                                                style: GoogleFonts.roboto(
                                                 color:  themeNotifier.isDark ? Colors.white : Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 23),
                                              SizedBox(
                                                height: 50,
                                                child: TextField(
                                                  onChanged: (value) {
                                                    folderName = value;
                                                  },
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          Container(
                                            width: double.infinity,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        right: BorderSide(
                                                            width: 0.35,
                                                            color:
                                                           themeNotifier.isDark ? Colors.white : Colors.black),
                                                        top: BorderSide(
                                                            width: 0.7,
                                                            color:themeNotifier.isDark ? Colors.white : Colors.black),
                                                      ),
                                                    ),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        'Cancel',
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          color:themeNotifier.isDark ? Colors.white : Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      border: Border(
                                                        top: BorderSide(
                                                            width: 0.7,
                                                            color:themeNotifier.isDark ? Colors.white : Colors.black),
                                                        left: BorderSide(
                                                            width: 0.35,
                                                            color:themeNotifier.isDark ? Colors.white : Colors.black),
                                                      ),
                                                    ),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(folderName);
                                                      },
                                                      child: Text(
                                                        'OK',
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ).then((value) {
                                    if (value != null && value.isNotEmpty) {
                                      setState(() {
                                        folderNames.add(value);
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                    padding: EdgeInsets.only(right: 15),
                                    width: 38,
                                    child: Image(
                                        image: AssetImage(
                                            'assets/MyFiles/NewFolder.png'),
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: folderNames.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    FolderSelect =
                                        index; // update the selected index
                                  });
                                },
                                child: Container(
                                  color: index == FolderSelect
                                      ? hexStringToColor("#BBDEFA")
                                      : null,
                                  child: Card(
                                    child: ListTile(
                                      leading: Image(
                                        image: AssetImage(
                                            "assets/MyFiles/Folder.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      title: Text(folderNames[index]),
                                      subtitle: Text("10 items | Mar 14"),
                                      trailing:
                                          Icon(Icons.keyboard_arrow_right),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : SafeArea(
                    child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
//AppBar
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            16,0, 16, 0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                  height: MediaQuery.of(context).size.height / 13,
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
                                    leading: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const Profilepage()));
                                      },
                                      child: CircleAvatar(
                                        radius: MediaQuery.of(context).size.height / 40,
                                        backgroundImage: const NetworkImage(
                                            "https://images.pexels.com/photos/1214205/pexels-photo-1214205.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                                      ),
                                    ),
                                    title: TextFormField(
                                      showCursor: true,
                                      cursorColor: themeNotifier.isDark
                                          ? Colors.white
                                          : Colors.black,
                                      style: GoogleFonts.roboto(
                                        fontSize: 15.0,
                                        color: themeNotifier.isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "Search library",
                                        suffixIcon: const Icon(
                                          Icons.search_rounded,
                                          color: Colors.black,
                                        ),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    trailing: PopupMenuButton(
                                      offset: Offset(MediaQuery.of(context).size.width, 0),
                                      position: PopupMenuPosition.under,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.elliptical(10, 15),
                                        ),
                                      ),
                                      icon: Icon(
                                        Icons.menu,
                                        size: MediaQuery.of(context).size.height / 30,
                                        color: themeNotifier.isDark
                                            ? const Color(0xFFdfdfdf)
                                            : const Color(0xFF222222),
                                      ),
                                      itemBuilder: (context) => [
                                        PopupMenuItem(
                                          height: MediaQuery.of(context).size.height / 16,
                                          value: 1,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: MediaQuery.of(context).size.height / 30,
                                                color: Colors.amber,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width / 20,
                                              ),
                                              Text(
                                                "Rate Us",
                                                style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                    MediaQuery.of(context).size.height /
                                                        45,
                                                    color: themeNotifier.isDark
                                                        ? const Color(0xFFFFFFFF)
                                                        : const Color(0xFF222222)),
                                              )
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          height: MediaQuery.of(context).size.height / 16,
                                          value: 2,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.dark_mode_rounded,
                                                size: MediaQuery.of(context).size.height / 30,
                                                color: themeNotifier.isDark
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width / 20,
                                              ),
                                              Text("Theme",
                                                  style: GoogleFonts.roboto(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize:
                                                      MediaQuery.of(context).size.height /
                                                          45,
                                                      color: themeNotifier.isDark
                                                          ? const Color(0xFFFFFFFF)
                                                          : const Color(0xFF222222)))
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          height: MediaQuery.of(context).size.height / 20,
                                          value: 3,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.diamond,
                                                size: MediaQuery.of(context).size.height / 30,
                                                color: themeNotifier.isDark
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width / 20,
                                              ),
                                              Text(
                                                "Purchases",
                                                style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                    MediaQuery.of(context).size.height /
                                                        45,
                                                    color: themeNotifier.isDark
                                                        ? const Color(0xFFFFFFFF)
                                                        : const Color(0xFF222222)),
                                              )
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          height: MediaQuery.of(context).size.height / 16,
                                          value: 4,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.contact_mail_rounded,
                                                size: MediaQuery.of(context).size.height / 30,
                                                color: themeNotifier.isDark
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width / 20,
                                              ),
                                              Text(
                                                "Contact Us",
                                                style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                    MediaQuery.of(context).size.height /
                                                        45,
                                                    color: themeNotifier.isDark
                                                        ? const Color(0xFFFFFFFF)
                                                        : const Color(0xFF222222)),
                                              )
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          height: MediaQuery.of(context).size.height / 16,
                                          value: 5,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.feedback_outlined,
                                                size: MediaQuery.of(context).size.height / 30,
                                                color: themeNotifier.isDark
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width / 20,
                                              ),
                                              Text(
                                                "Feedback",
                                                style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                    MediaQuery.of(context).size.height /
                                                        45,
                                                    color: themeNotifier.isDark
                                                        ? const Color(0xFFFFFFFF)
                                                        : const Color(0xFF222222)),
                                              )
                                            ],
                                          ),
                                        ),
                                        PopupMenuItem(
                                          height: MediaQuery.of(context).size.height / 16,
                                          value: 6,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.exit_to_app,
                                                size: MediaQuery.of(context).size.height / 30,
                                                color: const Color(0xFFFF0000),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context).size.width / 20,
                                              ),
                                              Text(
                                                "Logout",
                                                style: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                    MediaQuery.of(context).size.height /
                                                        45,
                                                    color: const Color(0xFFFF0000)),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                      elevation: 2,
                                      onSelected: (value) {
                                        if (value == 2) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                  const SettingsPage()));
                                        }
                                      },
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          isSelected
                              ? Container(
                                  width: MediaQuery.of(context).size.width / 7)
                              : IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(Icons.arrow_back),
                                ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3.2,
                          ),
                          isSelected
                              ? Center(
                                  child: Text(
                                    'Files',
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                )
                              : Text(
                                  folderNames[0],
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                          isSelected
                              ? Container(
                                  padding: EdgeInsets.only(right: 4),
                                  width:
                                      MediaQuery.of(context).size.width / 2.3,
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: Icon(Icons.playlist_add_check_rounded))
                              : Container()
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.7,
                        child: ListView.builder(
                          itemCount: Files.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  SelectedIndex = index;
                                  isSelected = true;
                                });
                              },
                              onDoubleTap: () {
                                setState(() {
                                  isSelected = false;
                                });
                              },
                              child: Card(
                                child: ListTile(
                                    leading: Image(
                                        image: AssetImage(
                                            Files[index].ImgFileType)),
                                    title: Text('${Files[index].Title}'),
                                    subtitle: Text('${Files[index].SubTitle}'),
                                    trailing: SelectedIndex == index
                                        ? Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: hexStringToColor(
                                                    '#2196F3')),
                                            child: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 12,
                                            ),
                                          )
                                        : Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    hexStringToColor('#6B6B6B'),
                                                width: 1,
                                              ),
                                            ),
                                          )),
                              ),
                            );
                          },
                        ),
                      ),
                      isSelected
                          ? Container()
                          : Container(
                              padding: EdgeInsets.only(right: 10, top: 30),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 9,
                              child: Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: hexStringToColor('#2196F3'),
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                    ],
                  )));
      });
    }
  }
}
