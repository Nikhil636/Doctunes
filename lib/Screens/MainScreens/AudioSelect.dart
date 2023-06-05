import 'package:doctunes/Useful/Functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../ThemeModel/thememodel.dart';
import '../../Useful/Model.dart';

class Listen extends StatefulWidget {
  const Listen({Key? key}) : super(key: key);

  @override
  State<Listen> createState() => _ListenState();
}

class _ListenState extends State<Listen> {
  List<ImageSelect> Images = [
    ImageSelect("assets/sample.jpg", 1),
    ImageSelect("assets/sample.jpg", 2),
    ImageSelect("assets/sample.jpg", 3),
    ImageSelect("assets/sample.jpg", 4),
    ImageSelect("assets/sample.jpg", 5),
    ImageSelect("assets/sample.jpg", 6),
  ];
  List<bool> firstContainerClicked = [];
  List<bool> secondContainerClicked = [];
  double _wpmValue = 200;
  double _value = 0;
  void _resetToDefault() {
    setState(() {
      _value = 2;
      _updateWpmValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        backgroundColor: themeNotifier.isDark ? Colors.black : Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.cancel_outlined),
                      color: themeNotifier.isDark ? Colors.white : Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      "Select",
                      style: GoogleFonts.roboto(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Container(
                padding: EdgeInsets.only(left: 18),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "Scan Mar. 27, 2023",
                  style: GoogleFonts.roboto(
                      fontSize: MediaQuery.of(context).size.width / 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 40),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.55,
                child: Scrollbar(
                  thickness: 6,
                  isAlwaysShown: true,
                  child: ListView.builder(
                      itemCount: (Images.length / 2).ceil(),
                      itemBuilder: (BuildContext context, int index) {
                        int firstIndex = index * 2;
                        int secondIndex = index * 2 + 1;
                        if (firstContainerClicked.length <
                            (Images.length / 2).ceil()) {
                          firstContainerClicked.add(false);
                        }

                        if (secondContainerClicked.length <
                            (Images.length / 2).ceil()) {
                          secondContainerClicked.add(false);
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  firstContainerClicked[index] =
                                      !firstContainerClicked[index];
                                });
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: 280,
                                    width:
                                        MediaQuery.of(context).size.width / 2.3,
                                    child: Column(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    firstContainerClicked[index]
                                                        ? hexStringToColor(
                                                            "#2196F3")
                                                        : hexStringToColor(
                                                            "#636F79"),
                                                width: 3.0,
                                              ),
                                            ),
                                            height: 230,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.2,
                                            child: Image(
                                              image: AssetImage(
                                                Images[firstIndex].img,
                                              ),
                                              fit: BoxFit.fill,
                                            )),
                                        Container(
                                          padding: EdgeInsets.only(top: 8),
                                          alignment:
                                              AlignmentDirectional.center,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.2,
                                          height: 30,
                                          child: Container(
                                            alignment:
                                                AlignmentDirectional.center,
                                            width: 25,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color:
                                                    firstContainerClicked[index]
                                                        ? hexStringToColor(
                                                            "#2196F3")
                                                        : Colors.transparent),
                                            child: Text(
                                              Images[firstIndex]
                                                  .pgno
                                                  .toString(),
                                              style: GoogleFonts.roboto(
                                                  color: firstContainerClicked[
                                                          index]
                                                      ? Colors.white
                                                      : themeNotifier.isDark
                                                          ? Colors.white
                                                          : Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 10, left: 140),
                                    child: ClipOval(
                                      child: SizedBox(
                                          width: 30,
                                          height: 30,
                                          child: firstContainerClicked[index]
                                              ? Container(
                                                  color: hexStringToColor(
                                                      "#2196F3"),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                    size: 23,
                                                  ),
                                                )
                                              : Container(
                                                  height: 25,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              13)
                                                      //more than 50% of width makes circle
                                                      ),
                                                )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    secondContainerClicked[index] =
                                        !secondContainerClicked[index];
                                  });
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 280,
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      child: Column(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: secondContainerClicked[
                                                          index]
                                                      ? hexStringToColor(
                                                          "#2196F3")
                                                      : hexStringToColor(
                                                          "#636F79"),
                                                  width: 3.0,
                                                ),
                                              ),
                                              height: 230,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.2,
                                              child: Image(
                                                image: AssetImage(
                                                  Images.length > secondIndex
                                                      ? Images[secondIndex].img
                                                      : '',
                                                ),
                                                fit: BoxFit.fill,
                                              )),
                                          Container(
                                            padding: EdgeInsets.only(top: 8),
                                            alignment:
                                                AlignmentDirectional.center,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.2,
                                            height: 30,
                                            child: Container(
                                              alignment:
                                                  AlignmentDirectional.center,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  color: secondContainerClicked[
                                                          index]
                                                      ? hexStringToColor(
                                                          "#2196F3")
                                                      : Colors.transparent),
                                              child: Text(
                                                Images.length > secondIndex
                                                    ? Images[secondIndex]
                                                        .pgno
                                                        .toString()
                                                    : '',
                                                style: GoogleFonts.roboto(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: secondContainerClicked[
                                                          index]
                                                      ? Colors.white
                                                      : themeNotifier.isDark
                                                          ? Colors.white
                                                          : Colors.black,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, left: 140),
                                      child: ClipOval(
                                        child: SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: secondContainerClicked[index]
                                                ? Container(
                                                    color: hexStringToColor(
                                                        "#2196F3"),
                                                    child: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 23,
                                                    ),
                                                  )
                                                : Container(
                                                    height: 25,
                                                    width: 25,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(13)
                                                        //more than 50% of width makes circle
                                                        ),
                                                  )),
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        );
                      }),
                ),
              ),
              // SizedBox(height: 80),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Padding(
                  padding: EdgeInsets.only(right: 25, top: 10,bottom: 10),
                  child: SizedBox(
                    height: 48,
                    width: MediaQuery.of(context).size.width / 2.9,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0), // Set border radius
                          ),
                        ),
                        onPressed: () {
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
                              return StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 60,
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
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(width: 50),
                                                Expanded(
                                                  child: Center(
                                                    child: Text(
                                                      'Select Speed',
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'Done',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 100,
                                          child: SfSlider(
                                              min: 1.0,
                                              max: 4.0,
                                              stepSize:
                                                  0.1, // Set the step size to 0.1 for 10 intermediate points
                                              value: _value,
                                              onChanged: (value) {
                                                setState(() {
                                                  _value = double.parse(
                                                      value.toStringAsFixed(1));
                                                  _updateWpmValue();
                                                });
                                              },
                                              enableTooltip: true,
                                              interval:
                                                  1.0, // Set the interval to 1 to show labels only for the major points
                                              showLabels: true,
                                              minorTicksPerInterval:
                                                  0, // Hide the minor ticks
                                              labelPlacement:
                                                  LabelPlacement.onTicks,
                                              tooltipTextFormatterCallback:
                                                  (dynamic value,
                                                      String formattedValue) {
                                                if (value.toInt() == value) {
                                                  switch (value.toInt()) {
                                                    case 1:
                                                      return 'Normal 1x';
                                                    case 2:
                                                      return 'Average 2x';
                                                    case 3:
                                                      return 'Faster 3x';
                                                    case 4:
                                                      return 'Speed Reader 4x';
                                                    default:
                                                      return '';
                                                  }
                                                } else {
                                                  return '$formattedValue x';
                                                }
                                              }),
                                        ),
                                        SizedBox(height: 20),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 25, vertical: 10),
                                          child: Row(
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: SizedBox(
                                                  height: 35,
                                                  child: ElevatedButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                        themeNotifier.isDark
                                                            ? Colors.black
                                                            : hexStringToColor(
                                                                '#D9D9D9'),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        _value = 1;
                                                        _updateWpmValue();
                                                      });
                                                    },
                                                    child: Text(
                                                      'Reset to Default',
                                                      style: GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: themeNotifier
                                                                  .isDark
                                                              ? Colors.white
                                                              : hexStringToColor(
                                                                  '#6B6B6B')),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Material(
                                                elevation: 3,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3),
                                                    color: themeNotifier.isDark
                                                        ? Colors.black
                                                        : hexStringToColor(
                                                            '#D9D9D9'),
                                                  ),
                                                  width: 90,
                                                  height: 35,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '$_value' + 'x',
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color:
                                                              hexStringToColor(
                                                                  '#2196F3'),
                                                        ),
                                                      ),
                                                      Text(
                                                        '$_wpmValue WPM',
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color:
                                                              hexStringToColor(
                                                                  '#2196F3'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Listen",
                              style: GoogleFonts.roboto(fontSize: 20),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.headphones)
                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: themeNotifier.isDark ? Colors.black : Colors.white,
          elevation: 0,
          unselectedItemColor:
              themeNotifier.isDark ? Colors.white : Colors.black,
          selectedItemColor: themeNotifier.isDark ? Colors.white : Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.file_copy_sharp),
              label: 'More',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: 'Edit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.delete),
              label: 'Delete',
            ),
          ],
        ),
      );
    });
  }

  void _updateWpmValue() {
    _wpmValue = (_value * 200).roundToDouble();
  }
}
