import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String? url;
  final BoxFit? fit;
  final Color? color;

  // oss裁剪的图片大小
  final int size;
  // 原始图片不做处理
  final bool original;

  const MyCachedNetworkImage(
    this.url, {
    Key? key,
    this.color,
    this.fit = BoxFit.cover,
    this.size = 300,
    this.original = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) return _pladeholder();

    if (!url!.startsWith("http")) {
      return _pladeholder();
    }

    return Container(
      color: color,
      child: CachedNetworkImage(
        imageUrl: _parseUrl(),
        fit: fit,
        placeholder: (_, __) {
          return _pladeholder();
        },
      ),
    );
  }

  String _parseUrl() {
    if (original) return url!;
    final ossParam = "x-oss-process=image/resize,m_mfit,h_${size * 2},w_${size * 2}";
    if (url!.contains("?")) {
      return "$url&$ossParam";
    } else {
      return "$url?$ossParam";
    }
  }

  _pladeholder() {
    return Container(
      color: color ?? Colors.grey[50],
      child: Center(
        child: Image.asset("assets/images/error_status.png", fit: fit),
      ),
    );
  }
}
