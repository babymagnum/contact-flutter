import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skor_id_flutter/utils/theme/theme_color.dart';
import 'package:skor_id_flutter/utils/theme/theme_text_style.dart';

class EmptyText extends StatelessWidget {

  final String text;
  final TextAlign? textAlign;
  final double? fontSize;

  EmptyText({required this.text, this.textAlign, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: textAlign ?? TextAlign.start, style: ThemeTextStyle.gothamRoundedRegular.apply(color: ThemeColor.lightGrey2, fontSizeDelta: fontSize ?? 16.sp));
  }
}