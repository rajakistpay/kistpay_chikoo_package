import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray60099 = fromHex('#997f7f7f');

  static Color gray5001 = fromHex('#f8f9f9');

  static Color black9009901 = fromHex('#99050505');

  static Color gray5002 = fromHex('#fef7ff');

  static Color blueA700 = fromHex('#3465ea');

  static Color blueGray10001 = fromHex('#d1d1d1');

  static Color gray80003 = fromHex('#505050');

  static Color gray80002 = fromHex('#414141');

  static Color gray80001 = fromHex('#49454f');

  static Color green700 = fromHex('#12ad18');

  static Color gray50 = fromHex('#fbfbf7');

  static Color black900 = fromHex('#000000');

  static Color indigoA70001 = fromHex('#1d3bff');

  static Color gray50001 = fromHex('#939393');

  static Color gray20001 = fromHex('#e7e7e7');

  static Color blueGray1003f = fromHex('#3fd1d1d1');

  static Color redA700 = fromHex('#ff0000');

  static Color gray600 = fromHex('#79747e');

  static Color gray700 = fromHex('#5b5b5b');

  static Color gray400 = fromHex('#b9b9b9');

  static Color gray60002 = fromHex('#6d6d6d');

  static Color gray500 = fromHex('#a8a8a8');

  static Color blueGray100 = fromHex('#cecece');

  static Color gray60001 = fromHex('#818181');

  static Color blueGray400 = fromHex('#7e859b');

  static Color gray800 = fromHex('#3a3a3a');

  static Color gray900 = fromHex('#1d1b20');

  static Color blue600 = fromHex('#3b84d3');

  static Color gray200 = fromHex('#eeeeee');

  static Color gray60003 = fromHex('#828282');

  static Color indigo400 = fromHex('#4968af');

  static Color deepPurple50000 = fromHex('#006750a4');

  static Color black90033 = fromHex('#33000000');

  static Color black90099 = fromHex('#99000000');

  static Color indigoA700 = fromHex('#2743fd');

  static Color gray40001 = fromHex('#c0c0c0');

  static Color indigoA400 = fromHex('#3866df');

  static Color blueGray40001 = fromHex('#888888');

  static Color whiteA700 = fromHex('#ffffff');

  static Color deepPurple400 = fromHex('#7b3fd3');


  static Color indigoA100 = fromHex('#8c9bf2');




  static Color black9003f = fromHex('#3f000000');

  static Color deepPurple200 = fromHex('#bd9fe9');


  static Color blueGray90001 = fromHex('#2d2d2d');

  static Color blueGray900 = fromHex('#373737');



  static Color deepPurple5001 = fromHex('#e5d3ff');


  static Color indigoA40001 = fromHex('#3b62ff');



  static Color deepPurple50 = fromHex('#ece6f0');



  static Color blue100 = fromHex('#c7d2ff');

  static Color gray70002 = fromHex('#636363');



  static Color gray70001 = fromHex('#696969');


  static Color deepPurple500 = fromHex('#6750a4');

  static Color red500 = fromHex('#ea4335');

  static Color deepPurple100 = fromHex('#decff4');


  static Color black9001e = fromHex('#1e000000');



  static Color lightGreen700 = fromHex('#5dac1d');

  static Color gray50003 = fromHex('#959595');

  static Color gray50002 = fromHex('#a7a7a7');

  static Color deepPurpleA700 = fromHex('#5a0fc8');

  static Color black900Bf = fromHex('#bf000000');







  static Color gray100 = fromHex('#f2f2f2');


  static Color black900Cc = fromHex('#cc000000');


  static Color deepPurple20001 = fromHex('#ad87e4');

  static Color blue400 = fromHex('#41b6e5');
  static Color grayBorderColor = fromHex('#79747E');  //6750A4

  static Color textFiledBorder = fromHex('#6750A4'); //

  static Color darkBlue = fromHex('#283957');

  static Color cardBackgroundColor = fromHex('#E8E8E8'); //

  static Color lightGrayColor = fromHex('#6D6D6D');

  static Color greenColor = fromHex('#2CA646');



  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
