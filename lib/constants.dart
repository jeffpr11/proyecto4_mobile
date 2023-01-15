import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF007BFF);
const kSecondaryColor = Color(0xFF4B545C);
const kPrimaryColorGradient = Color.fromARGB(72, 0, 123, 255);
const kSecondaryColorGradient = Color.fromARGB(42, 75, 84, 92);
const kPrimaryLightColor = Color(0xFFFFFFFF);
const kSuccessColor = Color(0xFF4CAF50);
const kDangerColor = Color(0xFFA81B1B);
const kDisableColor = Color(0xFFB1B1B1);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFECDF), Color(0xFF33BECA)],
);
const kAnimationDuration = Duration(milliseconds: 200);
const kAnimationMiliseconds = 500;
const kBaseUrl = "http://127.0.0.1:8000";
const kUrl = "http://127.0.0.1:8000/api";
final Dio dioConst = Dio();

var kdefaultIcons = {
  'pdf':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/PDF_file_icon.svg/267px-PDF_file_icon.svg.png',
  'word':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/.docx_icon.svg/640px-.docx_icon.svg.png',
  'excel':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/.xlsx_icon.svg/640px-.xlsx_icon.svg.png',
  'powerpoint':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/.pptx_icon_%282019%29.svg/640px-.pptx_icon_%282019%29.svg.png',
  'default':
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/.txt_OneDrive_icon.svg/640px-.txt_OneDrive_icon.svg.png',
};
