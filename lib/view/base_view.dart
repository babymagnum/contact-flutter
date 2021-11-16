import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skor_id_flutter/utils/theme/theme_color.dart';
import 'package:skor_id_flutter/utils/theme/theme_text_style.dart';
import 'package:skor_id_flutter/main.dart';
import 'package:skor_id_flutter/utils/widget/no_connection.dart';

class BaseView extends StatefulWidget {
  final bool isUseAppbar;
  final String? appbarTitle;
  final Widget? appbarLeading;
  final Widget child;
  final BottomNavigationBar? bottomNavigationBar;
  final List<Widget>? appbarActions;
  final bool isUseElevation;
  final Function? onTapBack;
  final bool useSafeArea;
  final bool automaticallyImplyLeading;
  final Widget? widgetAppbarTitle;
  final bool centerTitle;

  BaseView(
      {this.isUseAppbar: false,
      this.appbarTitle,
      this.useSafeArea: true,
      this.appbarLeading,
      this.appbarActions,
      required this.child,
      this.bottomNavigationBar,
      this.isUseElevation: true,
      this.onTapBack,
      this.widgetAppbarTitle,
      this.automaticallyImplyLeading: false,
      this.centerTitle: false});

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  Widget _content() {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Stack(
        children: [
          Container(width: Get.width, height: Get.height),
          Column(
            children: [
              Expanded(child: widget.child),
              Obx(() => NoConnection(
                  height: commonController.notConnected.value ? 30.h : 0))
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _appBar = AppBar(
      backgroundColor: Color(0xfffafafa),
      centerTitle: widget.centerTitle,
      brightness: Brightness.light,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      title: widget.widgetAppbarTitle != null
          ? widget.widgetAppbarTitle
          : widget.appbarTitle == null
              ? null
              : Text(widget.appbarTitle ?? '',
                  style: ThemeTextStyle.gothamRoundedMedium
                      .apply(color: ThemeColor.black, fontSizeDelta: 16.sp)),
      leading: widget.widgetAppbarTitle != null ? null : widget.appbarLeading ??
          IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: ThemeColor.black,
                size: 22.w,
              ),
              onPressed: () {
                widget.onTapBack != null ? widget.onTapBack!() : Get.back();
              }),
      actions: widget.appbarActions,
      elevation: widget.isUseElevation ? 4 : 0,
    );

    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: widget.isUseAppbar ? _appBar as PreferredSizeWidget? : null,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: widget.bottomNavigationBar,
      body: widget.useSafeArea ?
      SafeArea(child: _content(),) :
      _content(),
    );
  }
}
