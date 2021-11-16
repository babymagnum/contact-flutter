import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/utils/theme/theme_text_style.dart';
import '../contact_controller.dart';

class SearchContact extends StatelessWidget {
  ContactController _contactCt = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey.withOpacity(0.15)
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.fromLTRB(16.w, 13.h, 16.w, 11.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: TextField(
              onChanged: (value) => _contactCt.search(value.trim()),
              autocorrect: false,
              enableSuggestions: false,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              style: ThemeTextStyle.gothamRoundedRegular.apply(
                  color: Colors.black38.withOpacity(0.9),
                  fontSizeDelta: 16.sp),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(left: 8.w, right: 12.w),
                hintText: 'Search contacts',
                hintStyle: ThemeTextStyle.gothamRoundedRegular.apply(
                    color: Colors.black38.withOpacity(0.3),
                    fontSizeDelta: 16.sp),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}