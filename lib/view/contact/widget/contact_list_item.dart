import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/model/contact_list.dart';

class ContactListItem extends StatelessWidget {
  final ContactList item;

  ContactListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(item.name ?? ''),
      ],
    ).paddingSymmetric(vertical: 8.h);
  }
}
