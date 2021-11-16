import 'package:get/get.dart';
import 'package:skor_id_flutter/view/add_contact/add_contact_view.dart';
import 'package:skor_id_flutter/view/contact/contact_view.dart';

class Routes {
  static const CONTACT = '/contact';
  static const ADD_CONTACT = '/add_contact';

  static final pages = [
    GetPage(
        name: CONTACT, page: () => ContactView()),
    GetPage(name: ADD_CONTACT, page: () => AddContactView()),
  ];
}