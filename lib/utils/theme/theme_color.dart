import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeColor {
  static final ThemeColor _instance = ThemeColor._internal();

  ThemeColor._internal();

  factory ThemeColor() => _instance;

  static const primary = Color(0xFFFF4848);
  static const secondary = Color(0xFFC10011);
  static const black = Color(0xFF181921);
  static const lightGrey3 = Color(0xFFF2F2F2);

  static const red = Color(0xFFFF4848);
  static const darkRed1 = Color(0xFFC10011);
  static const grey = Color(0xFF292D35);
  static const initialGradient = Color(0xFF282C34);
  static const lightGrey1 = Color(0xFF2F3541);
  static const lightGrey2 = Color(0xFF606774);
  static const lightGrey4 = Color(0xFFB8BBC6);
  static const lightGrey5 = Color(0xFFACAFBC);
  static const lightGrey6 = Color(0xFF84868F);
  static const green2 = Color(0xFF27AE60);
  static const orange = Color(0xFFF2994A);
  static const oliveDrab = Color(0xFF4B6E0E);
  static const sapGreen = Color(0xFF58751B);
  static const orange2 = Color(0xFFEC9922);
  static const mahogany = Color(0xFFCE2B37);
  static const green1 = Color(0xFF219653);
  static const orange3 = Color(0xFFE18810);
  static const yellow = Color(0xFFF2C94C);
}
