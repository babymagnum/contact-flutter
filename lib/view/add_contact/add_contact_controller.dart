import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/model/contact_list.dart';
import 'package:skor_id_flutter/view/contact/contact_controller.dart';

class AddContactController extends GetxController {
  var contact = ContactList().obs;
  var labels = <Labels>[].obs;
  var textLabelCt = TextEditingController();
  ContactController _contactCt = Get.find();

  updateItem(ContactList value) => contact(value);

  void save() {
    if ((contact.value.name ?? '') == '') {
      Get.snackbar('Contact', 'Nama tidak boleh kosong', snackStyle: SnackStyle.FLOATING, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(16));
      return;
    } else if ((contact.value.phone ?? '') == '') {
      Get.snackbar('Contact', 'Nomor tidak boleh kosong', snackStyle: SnackStyle.FLOATING, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(16));
      return;
    }

    if (labels.isNotEmpty) contact.value.labels = labels;
    contact(contact.value);
    _contactCt.addContact(contact.value);

    textLabelCt.clear();

    Get.back();

    Get.snackbar('Contact', 'Berhasil menambahkan contact', snackStyle: SnackStyle.FLOATING, snackPosition: SnackPosition.BOTTOM, margin: EdgeInsets.all(16.0));
  }

  addLabels(Labels label) {
    if (label.title == '') return;

    labels.addIf(!labels.any((element) => element.title == label.title), label);
    textLabelCt.clear();
  }

  deleteLabels(Labels e) {
    final index = labels.indexWhere((element) => element.title == e.title);

    labels.removeAt(index);
  }

  @override
  void onClose() {
    textLabelCt.dispose();

    super.onClose();
  }
}