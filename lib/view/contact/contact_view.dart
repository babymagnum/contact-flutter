import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/utils/theme/theme_color.dart';
import 'package:skor_id_flutter/utils/theme/theme_text_style.dart';
import 'package:skor_id_flutter/utils/widget/button_reload.dart';
import 'package:skor_id_flutter/view/base_view.dart';
import 'package:skor_id_flutter/view/contact/contact_controller.dart';
import 'package:skor_id_flutter/view/contact/section/search_contact.dart';
import 'package:skor_id_flutter/view/contact/widget/contact_list_item.dart';

class ContactView extends StatelessWidget {

  var _contactCt = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return BaseView(
      isUseAppbar: true,
      centerTitle: true,
      isUseElevation: false,
      widgetAppbarTitle: Row(
        children: [
          GestureDetector(
            onTap: () => print('labels'),
            child: Text('Labels', style: ThemeTextStyle.gothamRoundedRegular.apply(color: Colors.pinkAccent, fontSizeDelta: 16.sp),),
          ),
          Expanded(
            child: Text('Manage Contact', textAlign: TextAlign.center, style: ThemeTextStyle.gothamRoundedMedium.apply(color: Colors.black, fontSizeDelta: 18.sp),),
          ),
          GestureDetector(
            onTap: () => print('icon add'),
            child: Icon(Icons.add, color: Colors.pinkAccent, size: 20.w,),
          )
        ],
      ),
      child: Obx(() => Column(
          children: [
            SearchContact(),
            Expanded(
              child: _contactCt.contactLoading.value ?
              Center(
                child: SizedBox(
                  width: 20.w, height: 20.w,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(ThemeColor.primary),
                  ),
                ),
              ) :
              _contactCt.contactList.isEmpty ?
              Center(
                child: ButtonReload(onTap: () => _contactCt.getContact(), content: 'Contact kosong, muat ulang?',),
              ) :
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemBuilder: (_, index) => ContactListItem((_contactCt.searchContact.value == '' ? _contactCt.contactList : _contactCt.filteredContactList)[index]),
                separatorBuilder: (_, __) => Divider(
                  height: 1, color: ThemeColor.lightGrey4,
                ),
                itemCount: (_contactCt.searchContact.value == '' ? _contactCt.contactList : _contactCt.filteredContactList).length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
