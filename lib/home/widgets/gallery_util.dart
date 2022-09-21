import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../shared/my_toast.dart';

/// 保存图片到相册
saveImageToGallery(String url, BuildContext context) async {
  if (Platform.isAndroid) {
    if (await Permission.storage.request().isGranted) {
      download(url);
    } else {
      showOpenAppSettingDialog(text: "需要打开相册权限", context: context);
      return;
    }
  } else if (Platform.isIOS) {
    if (await Permission.photos.request().isGranted) {
      download(url);
    } else {
      showOpenAppSettingDialog(text: "需要打开相册权限", context: context);
      return;
    }
  }
}

void download(String? url) {
  url ??= "";
  if (url.isEmpty) MyToast.show("图片为空，保存失败~");
  DefaultCacheManager().downloadFile(url).then((value) async {
    ImageGallerySaver.saveFile(value.file.path).then((value) {
      if (value is bool) {
        if (value) {
          MyToast.show("图片保存相册完成");
        } else {
          MyToast.show("保存失败~");
        }
      } else {
        MyToast.show("图片保存相册完成");
      }
    }).catchError((onError) {
      MyToast.show("图片保存失败");
    });
  }).catchError((onError) {
    MyToast.show("保存图片下载失败");
  });
}

showOpenAppSettingDialog({String text = "需要打开相关权限", required BuildContext context}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(text),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("取消"),
            ),
            TextButton(
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
              child: const Text("确认"),
            ),
          ],
        );
      });
}
