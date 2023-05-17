import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color.dart';

TextStyle size26_M_medium({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? Colors.black,
        fontSize: 26.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);

TextStyle size26_M_bold({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? Colors.black,
        fontSize: 26.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w800);

TextStyle size18_M_normal(
  Color lightGrey, {
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? Colors.black,
        fontSize: 18.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w300);

TextStyle size18_M_bold(
  Color lightGrey, {
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? Colors.black,
        fontSize: 18.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w700);

TextStyle size18_M_medium(
  Color lightGrey, {
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? Colors.black,
        fontSize: 18.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);

TextStyle size16_M_semibold({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? Colors.black,
        fontSize: 16.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);

TextStyle size16_M_normal({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? Colors.black,
        fontSize: 16.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w300);

TextStyle size13_M_normal({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? Colors.black,
        fontSize: 13.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w300);

TextStyle size12_M_semibold({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? Colors.black,
        fontSize: 12.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);

TextStyle size10_M_normal({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? Colors.black,
        fontSize: 10.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w300);
