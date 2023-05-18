import 'package:doctunes/MainScreens/MyFiles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Useful/Functions.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({Key? key}) : super(key: key);

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  int Selected = 1;
  int SelectedIndex = 0;
  int FolderSelect = -1;
  List<String> folderNames = [];
  @override
  Widget build(BuildContext context) {
    if (folderNames.isEmpty) {
      return Scaffold(
          body: SafeArea(
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
                                    color: hexStringToColor("#6B6B6B"),
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
                                              width: 0.35, color: Colors.black),
                                          top: BorderSide(
                                              width: 0.7, color: Colors.black),
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
                                            color: Colors.black,
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
                                              width: 0.7, color: Colors.black),
                                          left: BorderSide(
                                              width: 0.35, color: Colors.black),
                                        ),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(folderName);
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
                    image: AssetImage("assets/images/NewFolder.png"),
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: ListView.builder(
                    itemCount: folderNames.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            FolderSelect = index; // update the selected index
                          });
                        },
                        child: Container(
                          color: index == FolderSelect
                              ? hexStringToColor("#BBDEFA")
                              : Colors.white,
                          child: ListTile(
                            leading: Image(
                              image: AssetImage("assets/images/Folder.png"),
                              fit: BoxFit.fill,
                            ),
                            title: Text(folderNames[index]),
                            subtitle: Text("10 items | Mar 14"),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            )),
          ],
        ),
      ));
    } else {
      return Scaffold(
          body: SafeArea(
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
                  Spacer(),
                  GestureDetector(
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
                                      color: hexStringToColor("#6B6B6B"),
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
                                                color: Colors.black),
                                            top: BorderSide(
                                                width: 0.7,
                                                color: Colors.black),
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
                                              color: Colors.black,
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
                                                color: Colors.black),
                                            left: BorderSide(
                                                width: 0.35,
                                                color: Colors.black),
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
                    child: Container(
                        padding: EdgeInsets.only(right: 15),
                        width: 38,
                        child: Image(
                            image: AssetImage('assets/images/NewFolder.png'))),
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
                        FolderSelect = index; // update the selected index
                      });
                    },
                    child: Container(
                      color: index == FolderSelect
                          ? hexStringToColor("#BBDEFA")
                          : null,
                      child: ListTile(
                        leading: Image(
                          image: AssetImage("assets/images/Folder.png"),
                          fit: BoxFit.fill,
                        ),
                        title: Text(folderNames[index]),
                        subtitle: Text("10 items | Mar 14"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ));
    }
  }
}
