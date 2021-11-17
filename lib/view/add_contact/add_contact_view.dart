import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/utils/theme/theme_text_style.dart';
import 'package:skor_id_flutter/view/add_contact/add_contact_controller.dart';
import 'package:skor_id_flutter/view/add_contact/widget/contact_field.dart';
import '../base_view.dart';

class AddContactView extends StatelessWidget {

  var _addContactCt = Get.put(AddContactController());

  @override
  Widget build(BuildContext context) {
    return BaseView(
      isUseAppbar: true,
      isUseElevation: false,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('New Contact', style: ThemeTextStyle.gothamRoundedRegular.apply(color: Colors.black87, fontSizeDelta: 28.sp),),
                  SizedBox(height: 16.h,),
                  ContactField(
                    onChanged: (value) {
                      _addContactCt.contact.value.name = value;
                      _addContactCt.updateItem(_addContactCt.contact.value);
                    },
                    textInputType: TextInputType.text,
                    label: 'Name*',
                    hint: 'Contact name',
                  ),
                  SizedBox(height: 16.h,),
                  ContactField(
                    onChanged: (value) {
                      _addContactCt.contact.value.email = value;
                      _addContactCt.updateItem(_addContactCt.contact.value);
                    },
                    textInputType: TextInputType.emailAddress,
                    label: 'Email',
                    hint: 'Contact email address',
                  ),
                  SizedBox(height: 16.h,),
                  ContactField(
                    onChanged: (value) {
                      _addContactCt.contact.value.phone = value;
                      _addContactCt.updateItem(_addContactCt.contact.value);
                    },
                    textInputType: TextInputType.phone,
                    label: 'Phone*',
                    hint: 'Phone number',
                  ),
                  SizedBox(height: 16.h,),
                  ContactField(
                    onChanged: (value) {
                      _addContactCt.contact.value.notes = value;
                      _addContactCt.updateItem(_addContactCt.contact.value);
                    },
                    textInputType: TextInputType.text,
                    label: 'Notes',
                    hint: 'Anything about the contact',
                  ),
                  SizedBox(height: 16.h,),
                  ContactField(
                    onChanged: (value) { },
                    textInputType: TextInputType.text,
                    label: 'Labels',
                    isLabels: true,
                    hint: 'Contact label',
                  ),
                ],
              ).paddingSymmetric(horizontal: 16.w),
            ),
          ),
          InkWell(
            onTap: () => _addContactCt.save(),
            child: Container(
              width: Get.width,
              padding: EdgeInsets.only(top: 10.h, bottom: 11.h),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(6)
              ),
              child: Center(
                child: Text('Save', style: ThemeTextStyle.gothamRoundedRegular.apply(color: Colors.white, fontSizeDelta: 16.sp),),
              ),
            ),
          ).marginSymmetric(horizontal: 16.w, vertical: 16.h)
        ],
      ),
    );
  }
}
