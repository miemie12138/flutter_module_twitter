import 'dart:ui';
import 'package:flutter/material.dart';

class MyLoading {
  MyLoading._();

  static late BuildContext _context;

  static init(BuildContext context) {
    _context = context;
  }

  static OverlayEntry? _entry;

  /// 显示loading
  static show({String? msg, bool barrier = false, Duration timeout = const Duration(seconds: 30)}) {
    Future.delayed(timeout, hide);
    _entry = OverlayEntry(builder: (BuildContext context) {
      return MyLoadingWidget(message: msg ?? "", barrier: barrier);
    });

    Overlay.of(_context)?.insert(_entry!);
  }

  /// 隐藏loading
  static hide() {
    _entry?.remove();
    _entry = null;
  }
}

class MyLoadingWidget extends StatefulWidget {
  final String message;
  final bool barrier;
  const MyLoadingWidget({super.key, this.message = "", this.barrier = false});

  @override
  State<MyLoadingWidget> createState() => _MyLoadingWidgetState();
}

class _MyLoadingWidgetState extends State<MyLoadingWidget> {
  double opacity = 0;
  @override
  void initState() {
    Future.microtask(() {
      opacity = 1;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: opacity,
      child: Container(
        alignment: Alignment.center,
        color: widget.barrier ? const Color(0x66000000) : null,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0XC1000000),
                borderRadius: (BorderRadius.circular(9)),
                border: Border.all(width: 0.5, color: Colors.black87),
              ),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: (BorderRadius.circular(9)),
                  border: Border.all(width: 1, color: Colors.white12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: SizedBox(width: 32, height: 32, child: CircularProgressIndicator(strokeWidth: 4)),
                    ),
                    if (widget.message.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          widget.message,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Color(0xffdfdfdf),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
