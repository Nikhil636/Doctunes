import 'package:doctunes/Useful/Functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Useful/Model.dart';
import '../Useful/Widget.dart';

class Premium extends StatefulWidget {
  const Premium({Key? key}) : super(key: key);

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {
  List<FeaturesModel> Features = [
    FeaturesModel("assets/images/Premium Voice.png", "Premium\n  Voices",
        Icons.record_voice_over),
    FeaturesModel(
        "assets/images/Download.png", "Download", Icons.download_sharp),
    FeaturesModel("assets/images/No ads.png", "No Ads", CupertinoIcons.nosign),
    FeaturesModel("assets/images/translation.png", "  Advance\nTranslation",
        Icons.translate_rounded),
    FeaturesModel(
        "assets/images/ai 1.png", "Scanned\n   PDFs", Icons.document_scanner)
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              fontWeight: FontWeight.w700, color: Colors.black),
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
                "assets/images/PS_Illustration.svg",
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
                itemBuilder: (BuildContext context, int index, int realIndex) {
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
                                    width:
                                        MediaQuery.of(context).size.width / 2.2,
                                    decoration: BoxDecoration(
                                      color: selectedIndex == 0
                                          ? null
                                          : hexStringToColor("#D9D9D9"),
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
                                                            13)
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
                                width: MediaQuery.of(context).size.width / 2.2,
                                decoration: BoxDecoration(
                                  color: selectedIndex == 1
                                      ? null
                                      : hexStringToColor("#D9D9D9"),
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
                                                          BorderRadius.circular(
                                                              13)
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
                                width: MediaQuery.of(context).size.width / 2.2,
                                decoration: BoxDecoration(
                                  color: selectedIndex == 2
                                      ? null
                                      : hexStringToColor("#D9D9D9"),
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
            Material(
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
                      "assets/images/crown.png",
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
                          fontSize: MediaQuery.of(context).size.width * 0.056),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
