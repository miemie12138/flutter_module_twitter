 import 'package:flutter/material.dart';

import 'my_cached_network_image.dart';

///圆头像
class MyClipCircleWeight extends StatelessWidget {
  final String headImg;
  final double? size;

  const MyClipCircleWeight({Key? key, this.headImg = '', this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius:const BorderRadius.all(Radius.circular(100)),
        child: MyCachedNetworkImage(
            headImg.isEmpty ? 'https://resource.iwubida.com/cyclone/default/morentouxiang.png' : headImg),
      ),
    );
  }
}
