import 'package:dsp_teacher_application/Presentation/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget inputfield(
    var size,
    MaterialColor linecolor,
    MaterialColor hintcolor,
    MaterialColor iconcolor,
    String hint,
    String icon,
    bool coloredicone,
    controller,
    {bool isPass = false}) {
  return TextFormField(
    style: AppFonts.bodyText1.copyWith(color: hintcolor),
    controller: controller,
    obscureText: isPass,
    cursorColor: hintcolor,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(top: 20, bottom: 10),
      isDense: true,
      hintText: hint,
      hintStyle: AppFonts.bodyText1.copyWith(
        color: hintcolor,
      ),
      suffixIcon: isPass
          ? Padding(
              padding:
                  const EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 5),
              child: Icon(
                Icons.lock,
                color: iconcolor,
              ),
            )
          : null,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(top: 15, left: 5, right: 7, bottom: 7),
        child: SvgPicture.asset(
          'lib/Presentation/Images/$icon.svg',
          width: 24,
          height: 24,
          color: coloredicone ? iconcolor : null,
        ),
      ),
      border: InputBorder.none,
      focusedBorder: UnderlineInputBorder(
        //after start typing
        borderSide: BorderSide(color: linecolor),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        //before start typing
        borderSide: BorderSide(
          color: linecolor,
        ),
      ),
    ),
  );
}
