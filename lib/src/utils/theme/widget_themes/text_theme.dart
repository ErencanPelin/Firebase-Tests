import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Text_Theme {
  static TextTheme lightTextTheme = TextTheme(
    headline2: GoogleFonts.workSans(
      color: Colors.black87,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headline2: GoogleFonts.workSans(
      color: Colors.white,
    ),
  );
}
