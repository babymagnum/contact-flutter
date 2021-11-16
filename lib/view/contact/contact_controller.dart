import 'package:get/get.dart';
import 'package:skor_id_flutter/model/contact_list.dart';
import 'package:skor_id_flutter/networking/service/http_service.dart';

class ContactController extends GetxController {
  var contactLoading = false.obs;
  var contactList = <ContactList>[].obs;
  var filteredContactList = <ContactList>[].obs;
  var searchContact = ''.obs;

  void getContact() async {
    contactLoading(true);
    final data = await HttpService().getContact();
    contactLoading(false);

    contactList(data);
  }

  void search(String value) {
    searchContact(value);

    filteredContactList.clear();

    contactList.forEach((elementTopic) {
      if ((elementTopic.name ?? '').toLowerCase().contains(value)) filteredContactList.addIf(!filteredContactList.contains(elementTopic), elementTopic);

      (elementTopic.labels ?? []).forEach((elementLabels) {
        if ((elementLabels.title ?? '').toLowerCase().contains(value)) filteredContactList.addIf(!filteredContactList.contains(elementTopic), elementTopic);
      });
    });
  }

  @override
  void onInit() {
    getContact();

    super.onInit();
  }
}