import 'package:get/get.dart';
import 'package:skor_id_flutter/model/contact_list.dart';
import 'package:skor_id_flutter/networking/service/http_service.dart';

class ContactController extends GetxController {
  var contactLoading = false.obs;
  var contactList = <ContactList>[].obs;

  void getContact() async {
    contactLoading(true);
    final data = await HttpService().getContact();
    contactLoading(false);

    contactList(data);
  }

  @override
  void onInit() {
    getContact();

    super.onInit();
  }
}