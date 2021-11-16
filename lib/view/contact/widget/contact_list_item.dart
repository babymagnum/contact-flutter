import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/model/contact_list.dart';
import 'package:skor_id_flutter/utils/theme/theme_text_style.dart';

class ContactListItem extends StatelessWidget {
  final ContactList item;

  ContactListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(item.name ?? '', style: ThemeTextStyle.gothamRoundedRegular.apply(color: Colors.black87, fontSizeDelta: 14.sp),),
        ),
        Expanded(
          child: SingleChildScrollView(
            reverse: true,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: (item.labels ?? []).map((e) => Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Text(e.title ?? '', style: ThemeTextStyle.gothamRoundedRegular.apply(color: Colors.white, fontSizeDelta: 12.sp),),
              ).marginOnly(right: 6.w)).toList(),
            ),
          ),
        )
      ],
    ).paddingSymmetric(vertical: 16.h);
  }
}
