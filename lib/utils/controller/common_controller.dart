import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skor_id_flutter/model/app_config.dart';

class CommonController extends GetxController {
  var notConnected = false.obs;
  var appConfig = AppConfig.emptyAppConfig().obs;

  late SharedPreferences preferences;

  initValue(AppConfig config) async {
    preferences = await SharedPreferences.getInstance();
    appConfig(config);
  }

  checkConnection() async {
    var _check = await GetConnect().get('https://google.com');

    if (_check.statusCode == 200) {
      notConnected.value = false;
    } else {
      notConnected.value = true;
    }
  }

}
