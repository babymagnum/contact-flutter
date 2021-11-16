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
        Text(item.name ?? '', style: ThemeTextStyle.gothamRoundedRegular.apply(color: Colors.black87, fontSizeDelta: 14.sp),),
      ],
    ).paddingSymmetric(vertical: 16.h);
  }
}
