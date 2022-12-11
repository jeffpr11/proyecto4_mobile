import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF152254);
const kSecondaryColor = Color(0xFF60D4E6);
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
const kUrl = "http://10.0.2.2:8000/api";
final Dio dioConst = Dio();
