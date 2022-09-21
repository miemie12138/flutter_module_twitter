import 'package:flutter/material.dart';
import 'package:flutter_base_pkg/my_navigator.dart';
import 'package:flutter_base_pkg/widgets/my_app_bar.dart';
import 'package:flutter_base_pkg/widgets/my_scaffold.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'gallery_util.dart';

class PicturePreview extends StatefulWidget {
  final LoadingBuilder? loadingBuilder;
  final int initialIndex;
  final PageController? pageController;
  final List<String> galleryItems;
  final ValueChanged<int>? onPageChanged;

  PicturePreview({Key? key, required this.galleryItems, this.initialIndex = 0, this.loadingBuilder, this.onPageChanged})
      : pageController = PageController(initialPage: initialIndex),
        super(key: key);

  @override
  PicturePreviewState createState() => PicturePreviewState();
}

class PicturePreviewState extends State<PicturePreview> {
  int? currentIndex;

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
    widget.onPageChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: MyAppBar(
        leading: GestureDetector(
          onTap: MyNavigator.pop,
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: const EdgeInsets.only(left: 5),
            width: 30,
            height: 30,
            child: Image.asset("assets/images/close.png"),
          ),
        ),
        title: Text(
          '${currentIndex! + 1}/${widget.galleryItems.length}',
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
        actions: [
          GestureDetector(
            child: Row(
              children: [
                Image.asset("assets/images/download.png"),
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 15),
                  child: const Text(' 下载图片', style: TextStyle(fontSize: 10, color: Colors.white)),
                ),
              ],
            ),
            onTap: () {
              saveImageToGallery(widget.galleryItems[currentIndex ?? 0], context);
            },
          )
        ],
        backgroundColor: Colors.black,
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: _buildItem,
        itemCount: widget.galleryItems.length,
        loadingBuilder: widget.loadingBuilder ??
            (_, __) {
              return const Center(child: CircularProgressIndicator());
            },
        pageController: widget.pageController,
        onPageChanged: onPageChanged,
        backgroundDecoration: const BoxDecoration(color: Colors.black),
        scrollDirection: Axis.horizontal,
      ),
      color: Colors.black,
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final String item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions(
      onTapUp: (_, __, ___) {
        Navigator.pop(context);
      },
      imageProvider: NetworkImage(item),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * 0.8,
      maxScale: PhotoViewComputedScale.covered * 1.1,
      heroAttributes: PhotoViewHeroAttributes(tag: index.toString()),
    );
  }
}
