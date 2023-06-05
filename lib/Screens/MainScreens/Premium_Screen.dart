import 'package:doctunes/Useful/Functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../../ThemeModel/thememodel.dart';
import '../../Useful/Model.dart';
import '../../Useful/Widget.dart';

class Premium extends StatefulWidget {
  const Premium({Key? key}) : super(key: key);

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  List<FeaturesModel> Features = [
    FeaturesModel("assets/PremiumScreen/Premium Voice.png", "Premium\n  Voices",
        Icons.record_voice_over),
    FeaturesModel(
        "assets/PremiumScreen/Download.png", "Download", Icons.download_sharp),
    FeaturesModel(
        "assets/PremiumScreen/No ads.png", "No Ads", CupertinoIcons.nosign),
    FeaturesModel("assets/PremiumScreen/translation.png",
        "  Advance\nTranslation", Icons.translate_rounded),
    FeaturesModel("assets/PremiumScreen/Ai.png", "Scanned\n   PDFs",
        Icons.document_scanner)
  ];

  List<VoiceModel> Voices = [
    VoiceModel(
        'assets/PremiumScreen/Download.png', 'William', 'English', 'Male'),
    VoiceModel(
        'assets/PremiumScreen/Download.png', 'Andrew', 'Spanish', 'Male'),
    VoiceModel(
        'assets/PremiumScreen/Download.png', 'Lisa', 'Japanese', 'Female'),
    VoiceModel(
        'assets/PremiumScreen/Download.png', 'William', 'English', 'Male'),
    VoiceModel(
        'assets/PremiumScreen/Download.png', 'Andrew', 'Spanish', 'Male'),
    VoiceModel(
        'assets/PremiumScreen/Download.png', 'Lisa', 'Japanese', 'Female')
  ];
  int selectedIndex = 0;
  int selectedText = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor: themeNotifier.isDark ? Colors.black : Colors.white,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(
            color: hexStringToColor("#2196F3"),
          ),
          centerTitle: true,
          title: Text(
            "Premium Membership",
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                color: themeNotifier.isDark ? Colors.white : Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 16,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 1.8,
                child: SvgPicture.asset(
                  "assets/PremiumScreen/PS_Illustration.svg",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    "Features",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        fontSize: MediaQuery.of(context).size.width / 20),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 5.5,
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: Features.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return FeaturesWidget(
                      BgImg: Features[index].BgImg,
                      Title: Features[index].Title,
                      ImgIcon: Features[index].ImgIcon,
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    viewportFraction: 0.43,
                    aspectRatio: 16 / 9,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      viewportFraction: 0.43,
                      aspectRatio: 16 / 9,
                    ),
                    items: [
                      // 1 Year Plan Widget
                      Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 0;
                                });
                              },
                              child: Align(
                                alignment: AlignmentDirectional.bottomCenter,
                                child: ClipRect(
                                  child: Banner(
                                    message: "Best Seller",
                                    location: BannerLocation.topEnd,
                                    child: Container(
                                      height: 130,
                                      width: MediaQuery.of(context).size.width /
                                          2.2,
                                      decoration: BoxDecoration(
                                        color: selectedIndex == 0
                                            ? null
                                            : hexStringToColor("#D9D9D9")
                                                .withOpacity(0.5),
                                        border: selectedIndex == 0
                                            ? Border.all(color: Colors.blue)
                                            : null,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "1 YEAR",
                                            style: GoogleFonts.roboto(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "₹999",
                                            style: GoogleFonts.roboto(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "INR ₹83.3 p/m",
                                            style: GoogleFonts.roboto(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: selectedIndex == 0
                                      ? Colors.blue
                                      : hexStringToColor("#6B6B6B"),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Center(
                                  child: Text(
                                    "16% OFF!",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: ClipOval(
                                      child: SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: selectedIndex == 0
                                              ? Icon(
                                                  Icons.check_circle,
                                                  color: Colors.blue,
                                                )
                                              : Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13)),
                                                )),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // 1 Month Plan Widget
                      Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 1;
                                });
                              },
                              child: Align(
                                alignment: AlignmentDirectional.bottomCenter,
                                child: Container(
                                  height: 130,
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  decoration: BoxDecoration(
                                    color: selectedIndex == 1
                                        ? null
                                        : hexStringToColor("#D9D9D9")
                                            .withOpacity(0.5),
                                    border: selectedIndex == 1
                                        ? Border.all(color: Colors.blue)
                                        : null,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "MONTHLY",
                                        style: GoogleFonts.roboto(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "₹99",
                                        style: GoogleFonts.roboto(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "INR ₹99 p/m",
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: ClipOval(
                                      child: InkWell(
                                        onTap: () {},
                                        child: SizedBox(
                                            width: 25,
                                            height: 25,
                                            child: selectedIndex == 1
                                                ? Icon(
                                                    Icons.check_circle,
                                                    color: Colors.blue,
                                                  )
                                                : Container(
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13)
                                                        //more than 50% of width makes circle
                                                        ),
                                                  )),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // 3 Month Plan Widget
                      Container(
                        height: 140,
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = 2;
                                });
                              },
                              child: Align(
                                alignment: AlignmentDirectional.bottomCenter,
                                child: Container(
                                  height: 130,
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  decoration: BoxDecoration(
                                    color: selectedIndex == 2
                                        ? null
                                        : hexStringToColor("#D9D9D9")
                                            .withOpacity(0.5),
                                    border: selectedIndex == 2
                                        ? Border.all(color: Colors.blue)
                                        : null,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "3 MONTHS",
                                        style: GoogleFonts.roboto(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "₹249",
                                        style: GoogleFonts.roboto(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "INR ₹83 p/m",
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: selectedIndex == 2
                                      ? Colors.blue
                                      : hexStringToColor("#6B6B6B"),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Center(
                                  child: Text(
                                    "16% OFF!",
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  child: Align(
                                    alignment: AlignmentDirectional.topStart,
                                    child: ClipOval(
                                      child: SizedBox(
                                          width: 25,
                                          height: 25,
                                          child: selectedIndex == 2
                                              ? Icon(
                                                  Icons.check_circle,
                                                  color: Colors.blue,
                                                )
                                              : Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13)
                                                      //more than 50% of width makes circle
                                                      ),
                                                )),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              //Upgrage Now Button
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: themeNotifier.isDark
                        ? hexStringToColor('#2F3440')
                        : Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.0),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(builder:
                          (BuildContext context, StateSetter setState) {
                        return Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  color: themeNotifier.isDark
                                      ? hexStringToColor('#797979')
                                          .withOpacity(0.5)
                                      : hexStringToColor('#D9D9D9'),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 25),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                'Select Voice',
                                                style: GoogleFonts.roboto(
                                                    color: themeNotifier.isDark
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 18),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Done',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Center(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.15,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            color: hexStringToColor('#979B9E')
                                                .withOpacity(0.2),
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                          child: TextField(
                                            cursorColor: themeNotifier.isDark
                                                ? Colors.white
                                                : Colors.black,
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 12.0),
                                              prefixIcon: Icon(
                                                Icons.search,
                                                color: themeNotifier.isDark
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                              hintText: 'Search a voice',
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedText = 0;
                                      });
                                    },
                                    child: Text('Premium',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          color: selectedText == 0
                                              ? themeNotifier.isDark
                                                  ? Colors.white
                                                  : Colors.black
                                              : Colors.grey,
                                        )),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedText = 1;
                                      });
                                    },
                                    child: Text('Recent',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          color: selectedText == 1
                                              ? themeNotifier.isDark
                                                  ? Colors.white
                                                  : Colors.black
                                              : Colors.grey,
                                        )),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedText = 2;
                                      });
                                    },
                                    child: Text('All',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          color: selectedText == 2
                                              ? themeNotifier.isDark
                                                  ? Colors.white
                                                  : Colors.black
                                              : Colors.grey,
                                        )),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedText = 3;
                                      });
                                    },
                                    child: Text('Offline',
                                        style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          color: selectedText == 3
                                              ? themeNotifier.isDark
                                                  ? Colors.white
                                                  : Colors.black
                                              : Colors.grey,
                                        )),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: Voices.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return ListTile(
                                      leading: Stack(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle),
                                            child: Image.asset(
                                              Voices[index].img,
                                              width: 40,
                                              height: 40,
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle),
                                            child: Align(
                                              alignment: AlignmentDirectional
                                                  .bottomEnd,
                                              child: SvgPicture.asset(
                                                'assets/badge.svg',
                                                width: 18,
                                                height: 18,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      title: Text(
                                        Voices[index].title,
                                        style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      subtitle: Text(
                                        Voices[index].gender +
                                            ' | ' +
                                            Voices[index].language,
                                        style: GoogleFonts.roboto(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: hexStringToColor('#6B6B6B')),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                    },
                  );
                },
                child: Material(
                  elevation: 6,
                  shadowColor: Colors.grey.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(7.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        gradient: LinearGradient(colors: [
                          hexStringToColor("#2196F3"),
                          hexStringToColor("#2779BA")
                        ])),
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/PremiumScreen/crown.png",
                          fit: BoxFit.fill,
                          width: 22,
                          height: 28,
                        ),
                        const SizedBox(width: 15.0),
                        Text(
                          'UPGRADE NOW',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.056),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
