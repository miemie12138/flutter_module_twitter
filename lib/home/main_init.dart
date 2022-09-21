import 'package:flutter/material.dart';
import 'package:flutter_base_pkg/funcs.dart';
import 'package:flutter_base_pkg/http/my_http.dart';
import 'package:flutter_base_pkg/my_navigator.dart';

import '../manager/user_manager.dart';
import '../shared/my_loading.dart';
import '../shared/my_toast.dart';

class MainInit {
  MainInit._();
  static setup(BuildContext context) async {
    MyLoading.init(context);
    MainInit._initMyHttp();
    NavigatorManager.init(context);
  }

  static _initMyHttp() {
    MyHttp.init('https://chat.fbixfbi.com');
    MyHttp.baseOption.validateStatus = (code) => const {200, 400}.contains(code);
    // 公共 header
    MyHttp.baseHeader = () {
      return {"X-Token": UserManager.token};
    };

    // 响应处理
    MyHttp.onResponse = (resp) {
      if (resp.success || resp.hideToast) return;
      MyToast.show(resp.message);

      // ignore: avoid_print
      printDebug("🚨 ${resp.message} : ${resp.request}");
    };
  }
}
