// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:skor_id_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skor_id_flutter/model/contact_list.dart';
import 'package:skor_id_flutter/networking/service/http_service.dart';
import 'package:skor_id_flutter/utils/helper/constant.dart';
import 'package:skor_id_flutter/view/contact/contact_view.dart';
import 'package:skor_id_flutter/view/contact/widget/contact_list_item.dart';

void main() {
  testWidgets('Data testing from internet', (WidgetTester tester) async {
    var contactList = <ContactList>[];

    for (Map<String, dynamic> json in Constant.exampleData) {
      contactList.add(ContactList.fromJson(json));
    }
    
    expect(contactList.length, 7);
    expect(contactList[0].name, 'Andyanto Feng');
  });
}
