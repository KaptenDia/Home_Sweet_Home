import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Color blueColor = const Color(0xff5D5FEF);
Color greyColor = const Color(0xff606060);
Color whiteColor = const Color(0xffFFFFFF);
Color transgreyColor = const Color(0xff808080);
Color blackColor = const Color(0xff303030);

double defaultMargin = 30;

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;

TextStyle titleTextStyle = GoogleFonts.poppins(
  color: greyColor,
);

TextStyle priceTextStyle = GoogleFonts.poppins(
  color: blackColor,
  fontWeight: bold,
);

TextStyle subtitleTextStyle = GoogleFonts.poppins(
  color: blueColor,
  fontWeight: bold,
);

TextStyle subtitleTextStyle1 = GoogleFonts.poppins(
  color: blueColor,
);

TextStyle descriptionTextStyle = GoogleFonts.roboto(
  color: transgreyColor,
);

TextStyle descriptionTextStyle1 = GoogleFonts.roboto(
  color: greyColor,
);

TextStyle buttonTextStyle = GoogleFonts.poppins(
  color: whiteColor,
  fontWeight: bold,
);
