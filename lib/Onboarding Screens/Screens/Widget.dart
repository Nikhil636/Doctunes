import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Useful/Functions.dart';

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
