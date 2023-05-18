import 'package:doctunes/MainScreens/Folder.dart';
import 'package:doctunes/MainScreens/Premium_Screen.dart';
import 'package:doctunes/Useful/Functions.dart';
import 'package:doctunes/Useful/Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFiles extends StatefulWidget {
  const MyFiles({Key? key}) : super(key: key);

  @override
  State<MyFiles> createState() => _MyFilesState();
}

class _MyFilesState extends State<MyFiles> {
  List<FilesModel> Files = [
    FilesModel(
        "Doctunes origin.jpg", "2023-01-13 - 12:05", "assets/images/Image.png"),
    FilesModel("The Amazon Rainforest tropical...", "2023-01-13 - 10:15",
        "assets/images/Image.png"),
    FilesModel("The Layers of the Earth's Atmos...", "2023-01-11 - 10:00",
        "assets/images/TXT.png"),
    FilesModel("Mesozoic Life: Evolution and Di...", "2023-01-11 - 10:00",
        "assets/images/TXT.png"),
    FilesModel(
        "Doctunes origin.jpg", "2023-01-13 - 12:05", "assets/images/Image.png"),
    FilesModel("The Amazon Rainforest tropical...", "2023-01-13 - 10:15",
        "assets/images/Image.png"),
    FilesModel(
        "Doctunes origin.jpg", "2023-01-13 - 12:05", "assets/images/Image.png"),
    FilesModel("The Amazon Rainforest tropical...", "2023-01-13 - 10:15",
        "assets/images/Image.png"),
    FilesModel("The Layers of the Earth's Atmos...", "2023-01-11 - 10:00",
        "assets/images/TXT.png"),
    FilesModel("Mesozoic Life: Evolution and Di...", "2023-01-11 - 10:00",
        "assets/images/TXT.png"),
    FilesModel(
        "Doctunes origin.jpg", "2023-01-13 - 12:05", "assets/images/Image.png"),
    FilesModel("The Amazon Rainforest tropical...", "2023-01-13 - 10:15",
        "assets/images/Image.png"),
  ];
  int Selected = 0;
  int SelectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Material(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      ClipOval(
                        child: Container(
                            height: 30,
                            width: 30,
                            color: Colors.black,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            )),
                      ),
                      SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width / 1.35,
                        child: TextFormField(
                          showCursor: true,
                          cursorColor: Colors.black,
                          style: GoogleFonts.roboto(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: "Find a Language",
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
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: SizedBox(
                          height: 55,
                          width: 55,
                          child: Icon(Icons.menu),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Premium()));
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width / 1.05,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/Premium placeholder.png"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Upgrade Now !",
                                style: GoogleFonts.roboto(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Text(
                                "Don't settle for less, upgrade\nto the best with a premium plan!",
                                style: GoogleFonts.roboto(
                                    letterSpacing: 1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Icon(
                                        Icons.electric_bolt_sharp,
                                        color: hexStringToColor("#439FC2"),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(
                                        "UPGRADE NOW",
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                            color: hexStringToColor("#439FC2")),
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
                            width: MediaQuery.of(context).size.width / 3,
                            child: SvgPicture.asset(
                              "assets/images/Rocket.svg",
                              fit: BoxFit.fill,
                            )),
                      ],
                    ),
                  ],
                ),
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
                        },
                        child: Text(
                          "Recently Added",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Selected == 0
                                  ? hexStringToColor("#2196F3")
                                  : Colors.black),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FolderScreen()));
                        },
                        child: Text(
                          "Folder",
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Selected == 1
                                  ? hexStringToColor("#2196F3")
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.88,
                width: double.infinity,
                child: ListView.builder(
                    itemExtent: 70,
                    itemCount: Files.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () {
                          setState(() {
                            SelectedIndex = index; // update the selected index
                          });
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white,
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
                                              "assets/images/Share.png")),
                                      title: Text(
                                        'Share',
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18),
                                      ),
                                      onTap: () {},
                                    ),
                                    ListTile(
                                      leading: Image(
                                        image: AssetImage(
                                            "assets/images/Rename.png"),
                                        fit: BoxFit.fill,
                                      ),
                                      title: Text(
                                        'Rename',
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18),
                                      ),
                                      onTap: () {},
                                    ),
                                    ListTile(
                                      leading: Image(
                                          image: AssetImage(
                                              "assets/images/Select.png"),
                                          fit: BoxFit.fill),
                                      title: Text(
                                        'Select More',
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18),
                                      ),
                                      onTap: () {},
                                    ),
                                    ListTile(
                                      leading: Image(
                                          image: AssetImage(
                                              "assets/images/Move.png"),
                                          fit: BoxFit.fill),
                                      title: Text(
                                        'Move to Folder',
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18),
                                      ),
                                      onTap: () {},
                                    ),
                                    ListTile(
                                      leading: Image(
                                          image: AssetImage(
                                              "assets/images/Delete.png"),
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
                        child: Container(
                          color: index == SelectedIndex
                              ? hexStringToColor("#BBDEFA")
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
    );
  }
}
