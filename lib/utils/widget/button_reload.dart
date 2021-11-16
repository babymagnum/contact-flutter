import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skor_id_flutter/utils/theme/theme_text_style.dart';

class ButtonReload extends StatelessWidget {

  final Function onTap;
  final MainAxisAlignment? mainAxisAlignment;
  final String? content;

  ButtonReload({required this.onTap, this.mainAxisAlignment, this.content});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        children: [
          Icon(Icons.refresh, size: 16.w, color: Color(0xFFC4C4C4),),
          SizedBox(width: 6.w,),
          Text(content ?? 'Muat ulang?', style: ThemeTextStyle.gothamRoundedRegular.apply(fontSizeDelta: 16.sp, color: Color(0xFFC4C4C4)),)
        ],
      ),
    );
  }
}