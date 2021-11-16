import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/model/contact_list.dart';
import 'package:skor_id_flutter/utils/theme/theme_text_style.dart';
import 'package:skor_id_flutter/view/add_contact/add_contact_controller.dart';

class ContactField extends StatelessWidget {

  final Function(String value) onChanged;
  final TextInputType textInputType;
  final String label;
  final String hint;
  final bool isLabels;
  final TextEditingController? textEditingController;

  ContactField({required this.onChanged, required this.textInputType, required this.label, required this.hint, this.textEditingController, this.isLabels = false});

  AddContactController _addContactCt = Get.find();

  Widget _fieldForLabels() {
    return Column(
      children: [
        Obx(() => Row(
            children: [
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _addContactCt.labels.map((e) {
                      final index = _addContactCt.labels.indexWhere((element) => element.title == e.title);

                      return Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Row(
                          children: [
                            Text(e.title ?? '', style: ThemeTextStyle.gothamRoundedRegular.apply(color: Colors.white, fontSizeDelta: 12.sp),).marginOnly(right: 4.w),
                            GestureDetector(
                              onTap: () => _addContactCt.deleteLabels(e),
                              child: Icon(Icons.close, size: 12.w,),
                            )
                          ],
                        ),
                      ).marginOnly(right: index == _addContactCt.labels.length - 1 ? 0 : 6.w);
                    }).toList(),
                  ),
                ),
                constraints: BoxConstraints(maxWidth: Get.width * 0.6),
              ),
              SizedBox(width: _addContactCt.labels.length > 0 ? 6.w : 0,),
              Flexible(
                child: TextField(
                  controller: _addContactCt.textLabelCt,
                  autocorrect: false,
                  enableSuggestions: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  style: ThemeTextStyle.gothamRoundedRegular.apply(
                      color: Colors.black54,
                      fontSizeDelta: 14.sp),
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.only(right: 12.w, top: 8.h, bottom: 6.h),
                      hintText: hint,
                      hintStyle: ThemeTextStyle.gothamRoundedRegular.apply(
                          color: Colors.black26.withOpacity(0.3),
                          fontSizeDelta: 14.sp),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  var label = Labels();
                  label.title = _addContactCt.textLabelCt.value.text.trim();
                  _addContactCt.addLabels(label);
                },
                child: Icon(Icons.add, size: 16.w, color: Colors.pinkAccent,),
              )
            ],
          ),
        ),
        Container(
          width: Get.width, height: 1.0,
          color: Colors.black26.withOpacity(0.3),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: ThemeTextStyle.gothamRoundedRegular.apply(color: Colors.pinkAccent, fontSizeDelta: 11.sp),),
        isLabels ?
        _fieldForLabels() :
        TextField(
          controller: textEditingController,
          onChanged: (value) => onChanged(value.trim()),
          autocorrect: false,
          enableSuggestions: false,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          style: ThemeTextStyle.gothamRoundedRegular.apply(
              color: Colors.black54,
              fontSizeDelta: 14.sp),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(right: 12.w, top: 8.h, bottom: 6.h),
            hintText: hint,
            hintStyle: ThemeTextStyle.gothamRoundedRegular.apply(
                color: Colors.black26.withOpacity(0.3),
                fontSizeDelta: 14.sp),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.pinkAccent),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black26.withOpacity(0.3)),
            )
          ),
        ),
      ],
    );
  }
}
