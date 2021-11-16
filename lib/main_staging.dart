import 'package:flutter/material.dart';
import 'package:skor_id_flutter/model/app_config.dart';
import 'package:skor_id_flutter/utils/helper/constant.dart';
import 'main.dart';

void main() async {
  await mainCommon(AppConfig(Constant.API_STAGING, 'Contact Flutter Staging', false));

  runApp(MyApp());
}