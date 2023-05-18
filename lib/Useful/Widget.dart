import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Functions.dart';

class ListItemWidget extends StatelessWidget {
  final String img;
  final String title;
  final bool isSelected;

  const ListItemWidget({
    Key? key,
    required this.img,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 58,
          margin: const EdgeInsets.only(bottom: 6.0),
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
                    colors: [
                      hexStringToColor("#2196F3"),
                      hexStringToColor("#004DE1"),
                    ],
                  )
                : LinearGradient(
                    colors: [
                      hexStringToColor("#f1f2f3"),
                      hexStringToColor("#f1f2f3"),
                    ],
                  ),
            border: Border.all(color: Colors.black38),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    img,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(title,
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500, fontSize: 18))
              ],
            ),
          ),
        ),
      ],
    );
  }
}


//Premium Screen Widget



class FeaturesWidget extends StatelessWidget {
  final String BgImg;
  final String Title;
  final IconData ImgIcon;

  const FeaturesWidget({
    Key? key,
    required this.BgImg,
    required this.Title,
    required this.ImgIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            hexStringToColor("#518BD3"),
            hexStringToColor("#1D568B"),
            hexStringToColor("#1D82D2"),
          ],
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.center,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                BgImg,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(ImgIcon,color: Colors.white,size: 40,),
                Text(
                  Title,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

