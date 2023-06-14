import 'package:doctunes/Useful/Functions.dart';
import 'package:doctunes/config/DatabaseConfig/databaseModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/utils/utils.dart';
import '../../ThemeModel/thememodel.dart';
import '../../Useful/Model.dart';

class Faqs extends StatefulWidget {
  const Faqs({Key? key}) : super(key: key);

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  List<FAQModel> Faqitems = [
    FAQModel('How to create account ?',
        'DocTunes provides a hassle-free and user-friendly account creation process, offering two convenient options. Firstly, you can effortlessly create an account by filling out the registration form, where you can provide your necessary details. Alternatively, you have the option tostreamline the process by directly signing in with your existing Googleor Apple IDs. This allows for a seamless experience, ensuring that youcan quickly access and enjoy all the features and benefits DocTuneshas to offer.'),
    FAQModel('What is the point of purchasing a subscription plan?',
        'DocTunes provides a hassle-free and user-friendly account creation process, offering two convenient options. 2'),
    FAQModel('How can I pay ?',
        'DocTunes provides a hassle-free and user-friendly account creation process, offering two convenient options. 3'),
    FAQModel('What is the process to refund ?',
        'DocTunes provides a hassle-free and user-friendly account creation process, offering two convenient options. 3'),
    FAQModel('How can I download the audiobook on my device ?', 'Answer 3'),
    FAQModel('Where will the downloaded file go after the download competed ?',
        'Answer 3'),
  ];

  @override
  Widget build(BuildContext context) {
    final double docTunesTitleSize = MediaQuery.of(context).size.height / 34;
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: themeNotifier.isDark ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,

          elevation: 0,
          leading: BackButton(
            color: hexStringToColor("#2196F3"),
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
                    color: themeNotifier.isDark ? Colors.white : Colors.black,
                  ))),
              Text("Tunes",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: docTunesTitleSize,
                          letterSpacing: .76,
                          color: const Color(0xFF2196F3)))),
            ],
          )),
          //placeholder below
          actions: [
            Icon(
              Icons.password,
              color: Colors.transparent,
            )
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color:
              themeNotifier.isDark ? Colors.black : hexStringToColor('#6B6B6B'),
          child: Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.25,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: themeNotifier.isDark
                      ? hexStringToColor('#2F3440')
                      : Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45))),
              child: Column(

                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'FAQs',
                      style: GoogleFonts.roboto(
                          color: themeNotifier.isDark
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.width / 17),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.only(top: 25),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: Faqitems.length,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          title: Text(Faqitems[index].Question,
                              style: TextStyle(
                                  color: hexStringToColor('#2196F3'),
                                  fontSize:
                                      MediaQuery.of(context).size.width / 23,
                                  fontWeight: FontWeight.w500)),

                          backgroundColor: themeNotifier.isDark
                              ? hexStringToColor('#F2F9FF').withOpacity(0.05)
                              : hexStringToColor('#F2F9FF'),
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(
                                  bottom: 16,left: 16,right: 16),
                              child: Text(
                                Faqitems[index].Answer,
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 28,
                                    color: themeNotifier.isDark
                                        ? Colors.white
                                        : hexStringToColor('#6B6B6B')),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          Divider(color: themeNotifier.isDark ? Colors.white: Colors.black,thickness: 0.7,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
