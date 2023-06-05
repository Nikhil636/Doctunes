import 'package:doctunes/Screens/MainScreens/Folder.dart';
import 'package:doctunes/Screens/MainScreens/Premium_Screen.dart';
import 'package:doctunes/Screens/MainScreens/homepage.dart';
import 'package:doctunes/Useful/Functions.dart';
import 'package:doctunes/Useful/Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';

import 'profile.dart';
import 'settings.dart';
import '../../ThemeModel/thememodel.dart';
import 'AudioSelect.dart';

class MyFiles extends StatefulWidget {
  const MyFiles({Key? key}) : super(key: key);

  @override
  State<MyFiles> createState() => _MyFilesState();
}

class _MyFilesState extends State<MyFiles> {
  Color whiteTheme = const Color(0xFFd9d9d9);
  Color darkTheme = const Color(0xFF434853);

  List<FilesModel> Files = [
    FilesModel(
        "Doctunes origin.jpg", "2023-01-13 - 12:05", "assets/File Type/Image.png"),
    FilesModel("The Amazon Rainforest tropical...", "2023-01-13 - 10:15",
        "assets/File Type/Image.png"),
    FilesModel("The Layers of the Earth's Atmos...", "2023-01-11 - 10:00",
        "assets/File Type/Txt.png"),
    FilesModel("Mesozoic Life: Evolution and Di...", "2023-01-11 - 10:00",
        "assets/File Type/Txt.png"),
    FilesModel(
        "Doctunes origin.jpg", "2023-01-13 - 12:05", "assets/File Type/Image.png"),
    FilesModel("The Amazon Rainforest tropical...", "2023-01-13 - 10:15",
        "assets/File Type/Image.png"),
    FilesModel(
        "Doctunes origin.jpg", "2023-01-13 - 12:05", "assets/File Type/Image.png"),
    FilesModel("The Amazon Rainforest tropical...", "2023-01-13 - 10:15",
        "assets/File Type/Image.png"),
    FilesModel("The Layers of the Earth's Atmos...", "2023-01-11 - 10:00",
        "assets/File Type/Txt.png"),
    FilesModel("Mesozoic Life: Evolution and Di...", "2023-01-11 - 10:00",
        "assets/File Type/Txt.png"),
    FilesModel(
        "Doctunes origin.jpg", "2023-01-13 - 12:05", "assets/File Type/Image.png"),
    FilesModel("The Amazon Rainforest tropical...", "2023-01-13 - 10:15",
        "assets/File Type/Image.png"),
  ];
  int Selected = 0;
  int SelectedIndex = -1;
  int _selectedIndex = 1;
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
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingsPage()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context, ThemeModel themeNotifier, child) {
        return Scaffold(
          extendBody: true,
          backgroundColor: themeNotifier.isDark
              ? Colors.black
              : Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(

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
                    height: 20,
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
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    child: Row(
                      children: [
                        Hero(
                          tag: 'tag-2',
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Selected = 0;
                              });
                            },
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text(
                                "Recently Added",
                                style: GoogleFonts.roboto(
                                  decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color:themeNotifier.isDark && Selected == 0
                                        ? hexStringToColor("#2196F3")
                                        : !themeNotifier.isDark && Selected == 0
                                        ? hexStringToColor("#2196F3")
                                        : themeNotifier.isDark
                                        ?  hexStringToColor('#6B6B6B')
                                        : Colors.black,
                                ),
                              ),
                            )
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const FolderScreen()));
                            },
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text(
                                "Folder",
                                style: GoogleFonts.roboto(
                                  decoration: TextDecoration.none,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color:themeNotifier.isDark && Selected == 1
                                        ? hexStringToColor("#2196F3")
                                        : !themeNotifier.isDark && Selected == 1
                                        ? hexStringToColor("#2196F3")
                                        : themeNotifier.isDark
                                        ?  hexStringToColor('#6B6B6B')
                                        : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.8
                    ,
                    width: double.infinity,
                    child: ListView.builder(
                        itemExtent: 70,
                        itemCount: Files.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Listen()));
                            },
                            onLongPress: () {
                              setState(() {
                                SelectedIndex = index; // update the selected index
                              });
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: themeNotifier.isDark ? Colors.black : Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.0),
                                  ),
                                ),
                                builder: (BuildContext context) {
                                  return Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          leading: Image(
                                              image: AssetImage(
                                                  "assets/MyFiles/FileHold/Share.png",), color: themeNotifier.isDark ? Colors.white : Colors.black,),
                                          title: Text(
                                            'Share',
                                            style: GoogleFonts.roboto(
                                                color: themeNotifier.isDark ? Colors.white : Colors.black,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18),
                                          ),
                                          onTap: () {},
                                        ),
                                        ListTile(
                                          leading: Image(
                                            image: AssetImage(
                                                "assets/MyFiles/FileHold/Rename.png"), color: themeNotifier.isDark ? Colors.white : Colors.black,
                                            fit: BoxFit.fill,
                                          ),
                                          title: Text(
                                            'Rename',
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400, color: themeNotifier.isDark ? Colors.white : Colors.black,
                                                fontSize: 18),
                                          ),
                                          onTap: () {},
                                        ),
                                        ListTile(
                                          leading: Image(
                                              image: AssetImage(
                                                  "assets/MyFiles/FileHold/Select.png"), color: themeNotifier.isDark ? Colors.white : Colors.black,
                                              fit: BoxFit.fill),
                                          title: Text(
                                            'Select More',
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400, color: themeNotifier.isDark ? Colors.white : Colors.black,
                                                fontSize: 18),
                                          ),
                                          onTap: () {},
                                        ),
                                        ListTile(
                                          leading: Image(
                                              image: AssetImage(
                                                  "assets/MyFiles/FileHold/Move.png"), color: themeNotifier.isDark ? Colors.white : Colors.black,
                                              fit: BoxFit.fill),
                                          title: Text(
                                            'Move to Folder',
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400, color: themeNotifier.isDark ? Colors.white : Colors.black,
                                                fontSize: 18),
                                          ),
                                          onTap: () {},
                                        ),
                                        ListTile(
                                          leading: Image(
                                              image: AssetImage(
                                                  "assets/MyFiles/FileHold/Delete.png"), color: Colors.red,
                                              fit: BoxFit.fill),
                                          title: Text(
                                            'Delete',
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.red,
                                                fontSize: 18),
                                          ),
                                          onTap: () {},
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Card(
                              color: index == SelectedIndex
                                  ? themeNotifier.isDark
                                  ? hexStringToColor('#2196F3').withOpacity(0.6)
                                  : hexStringToColor("#BBDEFA").withOpacity(0.6)
                                  : null,
                              child: ListTile(
                                leading: Image(
                                    image: AssetImage(Files[index].ImgFileType)),
                                title: Text('${Files[index].Title}'),
                                subtitle: Text('${Files[index].SubTitle}'),
                                trailing: Icon(Icons.keyboard_arrow_right),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
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
      }
    );
  }
}
