import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String baseUrl = "http://192.168.1.107:4000";
// #####################################################################

final Color cyan1 = Color(0xff40bcd8);
final Color cyan2 = Color(0xff39a9db);
final Color cyan3 = Color(0xff1c77c3);
final Color gris1 = Color(0xffe9ecef);
final Color gris2 = Color(0xff939691);
final Color blue1 = Color(0xff1958a1);

// #####################################################################

final kHintTextStyle = GoogleFonts.oxygen(color: Colors.white54);

final kLabelStyle =
    GoogleFonts.oxygen(color: Colors.white, fontWeight: FontWeight.bold);

final kBoxDecorationStyle = BoxDecoration(
  color: cyan3,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(color: Colors.black12, blurRadius: 6.0, offset: Offset(0, 2)),
  ],
);
final titrePage = GoogleFonts.oxygen(color: Colors.white, fontSize: 22.0);

final disconnectStyle = GoogleFonts.oxygen(color: Colors.white, fontSize: 13.0);

final resultNotFound = GoogleFonts.oxygen(
    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0);

// #####################################################################

// BLACK
final black11Normal = GoogleFonts.oxygen(
    color: Colors.black, fontWeight: FontWeight.normal, fontSize: 11.0);

final black12Normal = GoogleFonts.oxygen(
    color: Colors.black, fontWeight: FontWeight.normal, fontSize: 11.5);

final black13Normal = GoogleFonts.oxygen(
    color: Colors.black, fontWeight: FontWeight.normal, fontSize: 13.0);

final black14Normal = GoogleFonts.oxygen(
    color: Colors.black, fontWeight: FontWeight.normal, fontSize: 14.0);

final black14Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.w600, color: Colors.black, fontSize: 14.0);

final black15Normal = GoogleFonts.oxygen(
  color: Colors.black,
  fontWeight: FontWeight.normal,
  fontSize: 15.0,
);

final black16Normal = GoogleFonts.oxygen(
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
    height: 1.4);

final black16Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.w600, color: Colors.black, fontSize: 16.0);

final black18Normal = GoogleFonts.oxygen(
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 18.0,
    height: 1.4);

final black18Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18.0);

// #####################################################################

// CYAN
final cyan13Normal = GoogleFonts.oxygen(
    color: cyan2, fontWeight: FontWeight.normal, fontSize: 13.0);

final cyan16Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.w600, color: cyan2, fontSize: 16.0);

final cyan17Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.w600, color: cyan2, fontSize: 17.0);

final cyan18Bold1_6 = GoogleFonts.oxygen(
    fontWeight: FontWeight.w600, color: cyan2, height: 1.6, fontSize: 18.0);

final cyan318Bold = GoogleFonts.oxygen(
    color: cyan3,
    letterSpacing: 1.5,
    fontSize: 18.0,
    fontWeight: FontWeight.bold);

final cyan18Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.w600, color: cyan2, fontSize: 18.0);

final cyan19Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.w600, color: cyan2, fontSize: 19.0);

final cyan20Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.w600, color: cyan2, fontSize: 20.0);

final cyan22Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.w600, color: cyan2, fontSize: 22.0);

// #####################################################################

// WHITE
final whiteNormal = GoogleFonts.oxygen(color: Colors.white);

final white11Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 11.0);

final white12Bold = GoogleFonts.oxygen(
    color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold);

final white13Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13);

final white14Normal = GoogleFonts.oxygen(
    fontWeight: FontWeight.normal, color: Colors.white, fontSize: 14.0);

final white14Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14.0);

final white15Normal = GoogleFonts.oxygen(
    fontWeight: FontWeight.normal, color: Colors.white, fontSize: 15.0);

final white15w400 = GoogleFonts.oxygen(
    color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.w400);

final white15Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15.0);

final white16Normal = GoogleFonts.oxygen(color: Colors.white, fontSize: 16.0);

final white16Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16);

final white17Bold = GoogleFonts.oxygen(
    color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold);

final white18Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18);

final white19Normal = GoogleFonts.oxygen(color: Colors.white, fontSize: 19.0);

final white19Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 19);

final white20Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.w600, color: Colors.white, fontSize: 20.0);

final white22Normal = GoogleFonts.oxygen(color: Colors.white, fontSize: 22.0);

final white22Bold = GoogleFonts.oxygen(
    color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold);

final white26Bold = GoogleFonts.oxygen(
    color: Colors.white, fontSize: 26.0, fontWeight: FontWeight.bold);

// #####################################################################

// GREEN
final green18Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.w600, color: Colors.green, fontSize: 18.0);

final darkGreen18Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.w600, color: Colors.lightGreen[800], fontSize: 18.0);

// #####################################################################

// RED
final red16Normal = GoogleFonts.oxygen(
    color: Colors.red,
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
    height: 1.4);

final red18Bold = GoogleFonts.oxygen(
    fontWeight: FontWeight.w600, color: Colors.red, fontSize: 18.0);

// #####################################################################

// final Color green1 = Color(0xFF5e8c61);
// final Color green2 =  Color(0xFF5e7961);
// final Color green3 =  Color(0xFF94e8b4);
// final Color green4 = Color(0xff72bda3);
// final Color green5 = Color(0xff406151);
// final Color yellow2= Color(0xffffc044).withOpacity(0.5);
// final Color yellow1 =  Color(0xFFffa62b);
// final Color blue2 = Color(0xff087f8c);
// final Color orange1=Color(0xffa5402d);
