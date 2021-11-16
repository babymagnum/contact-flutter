import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/model/app_config.dart';
import 'package:skor_id_flutter/utils/controller/common_controller.dart';
import 'package:skor_id_flutter/utils/helper/routes.dart';

final CommonController commonController = Get.put(CommonController(), permanent: true);

Future mainCommon(AppConfig appConfig) async {
  WidgetsFlutterBinding.ensureInitialized();
  await commonController.initValue(appConfig);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _connection;

  _connectivityResult() => commonController.checkConnection();

  @override
  void dispose() {
    _connection?.cancel();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Connectivity().checkConnectivity().then((result) => _connectivityResult());

    _connection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) => _connectivityResult());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => Obx(() => GetMaterialApp(
        title: commonController.appConfig.value.appName,
        navigatorKey: Get.key,
        initialRoute: Routes.CONTACT,
        getPages: Routes.pages,
        debugShowCheckedModeBanner: false,
      ),
      ),
    );
  }
}
