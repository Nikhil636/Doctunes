import 'package:doctunes/Screens/MainScreens/MyFiles.dart';
import 'package:doctunes/Screens/MainScreens/profile.dart';
import 'package:doctunes/Screens/MainScreens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import '../../ThemeModel/thememodel.dart';
import '../../Useful/Functions.dart';
import '../../Useful/Model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FilesModel> Files = [
    FilesModel("Doctunes origin.jpg", "2023-01-13 - 12:05",
        "assets/File Type/Image.png"),
    FilesModel("The Amazon Rainforest tropical...", "2023-01-13 - 10:15",
        "assets/File Type/Image.png"),
    FilesModel("The Layers of the Earth's Atmos...", "2023-01-11 - 10:00",
        "assets/File Type/Txt.png"),
    FilesModel("Mesozoic Life: Evolution and Di...", "2023-01-11 - 10:00",
        "assets/File Type/Txt.png"),
  ];
  String fileName = "DocTunes origin.jpg";
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyFiles()),
      );
    }
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      );
    }
  }

  // @override
  // void initState() {
  //   FolderDatabase.instance.readAllNotes();
  //   ChildFolderDatabase.instance.readAllNotes();
  //   super.initState();
  // }
  //
  // ChildMedia childMedia = ChildMedia(
  //     masterId: 1,
  //     childFolderId: 1,
  //     childItemName: "Name",
  //     createdTime: DateTime.now());
  //
  // FolderMedia masterMedia = FolderMedia(
  //     masterId: 1,
  //     masterFolderName: "R",
  //     createdTime: DateTime.now(),
  //     numberOFItems: 1);

  @override
  Widget build(BuildContext context) {
    final double docTunesTitleSize = MediaQuery.of(context).size.height / 34;
    final double backgroundImageSize = MediaQuery.of(context).size.height / 11;
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor: themeNotifier.isDark ? Colors.black : Colors.white,
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              16, MediaQuery.of(context).size.height / 20, 16, 0),
          child: Column(
            children: [
              Row(
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
                      title: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Doc",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: docTunesTitleSize,
                                      letterSpacing: .76,
                                      color: themeNotifier.isDark
                                          ? Colors.white
                                          : Colors.black))),
                          Text("Tunes Pro",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: docTunesTitleSize,
                                      letterSpacing: .76,
                                      color: const Color(0xFF2196F3)))),
                        ],
                      )),
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              GestureDetector(
                onTap: () async {
                  // if (kDebugMode) {
                  //   print("Pressing the button");
                  // }
                  // await FolderDatabase.instance.update(
                  //   FolderMedia(
                  //       masterId: 1,
                  //       masterFolderName: "Name",
                  //       createdTime: DateTime.now(),
                  //       numberOFItems: 10),
                  // );
                  // await FolderDatabase.instance.readMedia(1);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: backgroundImageSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                              image: AssetImage(
                                  "assets/Home Screen/scan_back.png"),
                              fit: BoxFit.cover),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Icon(
                                  Icons.document_scanner,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height / 17,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Scan Pages",
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              letterSpacing: .76,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  38,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white))),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        125,
                                  ),
                                  Text(
                                    "Scan text or documents",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              63),
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      height: backgroundImageSize,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image:
                                AssetImage("assets/Home Screen/Paste bg.png"),
                            fit: BoxFit.fill),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Icon(
                                Icons.file_copy_rounded,
                                color: Colors.white,
                                size: MediaQuery.of(context).size.height / 17,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Paste text",
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          letterSpacing: .76,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              38,
                                          fontWeight: FontWeight.w700,
                                          color: Colors
                                              .white // color: themeNotifier.isDark
                                          )),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 125,
                                ),
                                Text(
                                  "Input or Paste your text",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                63),
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        height: backgroundImageSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                              image: AssetImage(
                                  "assets/Home Screen/Import Bg.png"),
                              fit: BoxFit.fill),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: Icon(
                                  Icons.drive_folder_upload_rounded,
                                  color: Colors.white,
                                  size: MediaQuery.of(context).size.height / 17,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Import file",
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              letterSpacing: .76,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  38,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white))),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        125,
                                  ),
                                  Text(
                                    "Use text file from Storage",
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              63),
                                    ),
                                  )
                                ],
                              )
                            ]),
                      ),
                      onTap: () {
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          backgroundColor: themeNotifier.isDark
                              ? const Color(0xFF2f3440)
                              : const Color(0xFFe7dada),
                          context: context,
                          builder: (context) {
                            return Wrap(
                              runSpacing: 15,
                              textDirection: TextDirection.ltr,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Text(
                                    "Import document",
                                    style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            letterSpacing: .76,
                                            fontWeight: FontWeight.w500,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                40,
                                            color: themeNotifier.isDark
                                                ? Colors.white
                                                : Colors.black)),
                                  ),
                                ),
                                GestureDetector(
                                  child: ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    tileColor: themeNotifier.isDark
                                        ? const Color(0xFF464a55)
                                        : Colors.white,
                                    leading: Image.asset(
                                        'assets/Home Screen/import_dropdown/Pdf.png'),
                                    title: Text(
                                      "Select Pdf",
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  40,
                                              letterSpacing: .76)),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      tileColor: themeNotifier.isDark
                                          ? const Color(0xFF464a55)
                                          : Colors.white,
                                      leading: Image.asset(
                                          'assets/Home Screen/import_dropdown/image.png'),
                                      title: Text(
                                        "Select Image",
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40,
                                                letterSpacing: .76)),
                                      )),
                                ),
                                GestureDetector(
                                  child: ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      tileColor: themeNotifier.isDark
                                          ? const Color(0xFF464a55)
                                          : Colors.white,
                                      leading: Image.asset(
                                          'assets/Home Screen/import_dropdown/link.png'),
                                      title: Text(
                                        'Paste a web link',
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    40,
                                                letterSpacing: .76)),
                                      )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  child: Center(
                                    child: Text(
                                        "More documents types coming soon",
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: const Color(0xFF979aa0),
                                                letterSpacing: 0.76,
                                                fontSize: MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    50,
                                                fontWeight: FontWeight.w500))),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "OPEN RECENT",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: MediaQuery.of(context).size.height / 54,
                          color: themeNotifier.isDark
                              ? const Color(0xFFe0e0e0)
                              : const Color(0xFF6f6f6f))),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemExtent: 85,
                    itemCount: Files.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image(
                              image: AssetImage(Files[index].ImgFileType)),
                          title: Text('${Files[index].Title}'),
                          subtitle: Text('${Files[index].SubTitle}'),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: MediaQuery.of(context).size.height / 27,
          currentIndex: _selectedIndex,
          unselectedLabelStyle: GoogleFonts.roboto(
              textStyle: TextStyle(
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
}
