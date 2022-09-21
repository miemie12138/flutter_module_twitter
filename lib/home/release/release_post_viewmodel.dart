import 'dart:io';

import 'package:flutter/material.dart';
import 'package:twitter/shared/my_loading.dart';

import '../../shared/my_toast.dart';

class ReleasePostViewModel with ChangeNotifier {
  String content = '';
  String type = '每个人';
  List<File>? images = [];

  FocusNode focusNode = FocusNode();

  releasePost() async {
    if (content.isEmpty) {
      MyToast.show('请填写您的帖子内容');
      return;
    }

    MyLoading.show(msg: '正在发布中...', barrier: true);
  }
}
