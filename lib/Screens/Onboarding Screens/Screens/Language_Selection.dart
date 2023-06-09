import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctunes/Screens/MainScreens/MyFiles.dart';
import 'package:doctunes/Useful/Model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class language_Selection extends StatefulWidget {
  const language_Selection({Key? key}) : super(key: key);

  @override
  State<language_Selection> createState() => _language_SelectionState();
}

class _language_SelectionState extends State<language_Selection> {
  List<LanguageModel> languages = [
    LanguageModel("assets/Flags/Usa flag.svg", "English", false),
    LanguageModel("assets/Flags/India Flag.svg", "Hindi", false),
    LanguageModel("assets/Flags/French.svg", "French", false),
    LanguageModel("assets/Flags/Germany.svg", "German", false),
    LanguageModel("assets/Flags/Italy.svg", "Italian", false),
    LanguageModel("assets/Flags/Korea.svg", "Korean", false),
    LanguageModel("assets/Flags/Norway.svg", "Norwegian", false),
    LanguageModel("assets/Flags/Polish.svg", "Polish", false),
  ];
  String? _selectedItem;
  Future<void> saveSelectedItem(String selectedItem) async {
    // Get a reference to the Firestore database and the current user's document
    final db = FirebaseFirestore.instance;
    final currentUser = FirebaseAuth.instance.currentUser;
    final currentUserDocRef = db.collection('users').doc(currentUser!.uid);

    try {
      // Update the current user's document with the selected item
      await currentUserDocRef.update({
        'Language': selectedItem,
      });
      print('Selected item saved successfully!');
    } catch (e) {
      print('Error saving selected item: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Select Language",
                style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            const   SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 55,
              width: MediaQuery.of(context).size.width / 1.1,
              child: TextFormField(
                showCursor: true,
                cursorColor: Colors.black,
                style: GoogleFonts.roboto(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "Find a Language",
                  suffixIcon:   const  Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                  ),
                  filled: true,
                  fillColor: Colors.blueAccent.withOpacity(0.15),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const   SizedBox(
              height: 50,
            ),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              decoration:
                  BoxDecoration(color: Colors.blueAccent.withOpacity(0.15)),

              child: Column(
                children: [
                  ListView.builder(
                    padding:   const  EdgeInsets.only(top: 25),
                    itemExtent: 65.0,
                    shrinkWrap: true,
                    itemCount: languages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final language = languages[index];
                      return InkWell(
                        onTap: (){
                          setState(() {
                            for (var lang in languages) {
                              lang.isSelected = false;
                            }
                            language.isSelected = true;
                            _selectedItem = language.language;
                          });
                        },
                        child: LanguageItem(
                            languages[index].language,
                            languages[index].flagImage,
                            languages[index].isSelected,
                            index),
                      );
                    },
                  ),

                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue.shade400,
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyFiles()),
                              );
                              await saveSelectedItem(_selectedItem!);
                            },
                            child:    const Text(
                              "DONE",
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget LanguageItem(
      String language, String flagImage, bool isSelected, int index) {
    return ListTile(
      leading: SizedBox(
          width: 80,
          child: SvgPicture.asset(
            flagImage,
            height: 40,
          )),
      title: Text(
        language,
        style: GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 17),
      ),
      trailing: isSelected
          ? const Icon(
              Icons.check,
              color: Colors.blueAccent,
            )
          : null,

    );
      }
  }
