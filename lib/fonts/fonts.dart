import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class title_font extends StatelessWidget {
  final String text;
  const title_font({super.key , required this.text });

  @override
  Widget build(BuildContext context) {
    return Text(text ,
    style: GoogleFonts.sourceSansPro(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 22,

    ),

    );
  }
}
