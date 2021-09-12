import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Text('FlutterdevConnect',
          style: GoogleFonts.dancingScript(textStyle: TextStyle(fontSize: 25))),
    ),
    elevation: 0,
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white54),
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 16);
}

Widget customButton1(BuildContext context, String text) {
  Color color1 = Colors.pink;
  Color color2 = Colors.blue;
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2]),
        borderRadius: BorderRadius.circular(10)),
    child: Text(
      text,
      style: GoogleFonts.josefinSans(fontSize: 17, color: Colors.white),
    ),
  );
}

Widget customButton2(BuildContext context, String text) {
  Color color1 = Colors.blue;
  Color color2 = Colors.pink;
  return Container(
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color1, color2]),
        borderRadius: BorderRadius.circular(10)),
    child: Text(
      text,
      style: GoogleFonts.josefinSans(fontSize: 17, color: Colors.white),
    ),
  );
}
