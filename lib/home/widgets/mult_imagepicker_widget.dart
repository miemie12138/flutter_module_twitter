import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_base_pkg/funcs.dart';

import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../model/image_model.dart';

class MultImagePickerWidget extends StatefulWidget {
  final int maxImages;
  final int picSize;
  final ValueChanged<List<File>>? valueChanged;
  final ValueChanged<int>? deleteChanged;
  final List<ImageModel>? netImgs;
  const MultImagePickerWidget({
    Key? key,
    this.maxImages = 9,
    this.valueChanged,
    this.picSize = 0,
    this.netImgs,
    this.deleteChanged,
  }) : super(key: key);

  @override
  MultImagePickerWidgetState createState() => MultImagePickerWidgetState();
}

class MultImagePickerWidgetState extends State<MultImagePickerWidget> {
  List<AssetEntity>? images = [];
  List<Widget> assetThumbs = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = MediaQuery.of(context).size.width ~/ 100;
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: widget.picSize == 0 ? crossAxisCount : widget.picSize,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1,
      ),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ...buildNetItems(),
        ...buildItems(),
        Visibility(
          visible: widget.netImgs == null
              ? assetThumbs.length < widget.maxImages
              : (assetThumbs.length + widget.netImgs!.length) < widget.maxImages,
          child: GestureDetector(
            onTap: pickerImage,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.all(Radius.circular(3)),
              ),
              child: Icon(Icons.add, size: 60, color: Colors.grey[400]),
            ),
          ),
        )
      ], //禁止滚动
    );
  }

  // 生成GridView的items
  List<Widget> buildItems() {
    List<Widget> items = <Widget>[];

    for (var i = 0; i < assetThumbs.length; i++) {
      final item = ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Stack(
          children: [
            Container(
              child: assetThumbs[i],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    assetThumbs.removeAt(i);
                    images!.removeAt(i);
                  });
                  onChange();
                },
                child: Image.asset('assets/images/shanchuzhaopian.png'),
              ),
            ),
          ],
        ),
      );
      items.add(item);
    }

    return items;
  }

  //生成网络图片的items
  List<Widget> buildNetItems() {
    List<Widget> items = <Widget>[];
    if (widget.netImgs == null || widget.netImgs!.isEmpty) {
      return [];
    }
    for (var i = 0; i < widget.netImgs!.length; i++) {
      final item = ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Stack(
          children: [
            Image.network(
              widget.netImgs![i].resourceUrl,
              fit: BoxFit.cover,
              width: 200,
              height: 200,
            ),
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  onDeleteChange(i);
                  // print('${assetThumbs.length}---${widget.netImgs!.length}---${widget.maxImages}');
                },
                child: Image.asset(
                  'assets/images/mine/shanchuzhaopian.png',
                ),
              ),
            ),
          ],
        ),
      );
      items.add(item);
    }

    return items;
  }

  pickerImage() {
    AssetPicker.pickAssets(context,
        pickerConfig: AssetPickerConfig(
          gridThumbnailSize: const ThumbnailSize.square(400),
          maxAssets: widget.netImgs == null ? widget.maxImages : widget.maxImages - widget.netImgs!.length,
          selectedAssets: images,
        )

        // cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        ).then((res) async {
      images = res;
      assetThumbs = [];

      for (var image1 in res!) {
        assetThumbs.add(Image(
          image: AssetEntityImageProvider(image1, thumbnailSize: const ThumbnailSize.square(150), isOriginal: false),
          fit: BoxFit.cover,
          width: 150,
          height: 150,
        ));
      }

      setState(() {});
      onChange();
    }).catchError((e) {
      printDebug(e);
    });
  }

  onChange() {
    if (images == null) {
      return;
    }
    List<File> files = [];
    // 转为 File
    Future.wait(images!.map((e) => e.originFile).toList()).then((value) {
      files = value.cast<File>().toList();
      widget.valueChanged?.call(files);
    });

    // images!.removeWhere((item) => item.originalWidth < 1);
    // widget.valueChanged?.call(files);
  }

  onDeleteChange(int index) {
    widget.deleteChanged?.call(index);
  }
}
