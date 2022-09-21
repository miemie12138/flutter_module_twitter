import 'package:flutter/material.dart';
import 'package:flutter_base_pkg/my_navigator.dart';

class PostDialog extends StatefulWidget {
  final ValueChanged<String>? callBack;

  const PostDialog({Key? key, this.callBack}) : super(key: key);

  @override
  BottomState createState() => BottomState();
}

class BottomState extends State<PostDialog> {
  String? id;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              widget.callBack!.call(id ?? "每个人");
              MyNavigator.pop();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 23, right: 23, top: 10),
              child: const Text('谁可以回复？', style: TextStyle(fontSize: 14, color: Colors.black))),
          Container(
              margin: const EdgeInsets.only(left: 23, right: 23, top: 10),
              child: const Text('dsafasfsafafqf', style: TextStyle(fontSize: 12, color: Colors.grey))),
          GestureDetector(
            onTap: () {
              setState(() {
                id = "每个人";
              });
            },
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 23, right: 23, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset('assets/images/interest_img.png'),
                          Visibility(
                              visible: id == "每个人",
                              child: Positioned(bottom: 0, right: 0, child: Image.asset('assets/images/right_img.png')))
                        ],
                      ),
                      const SizedBox(width: 20),
                      const Text("每个人")
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                id = "2";
              });
            },
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/follow_img.png'),
                      const SizedBox(width: 20),
                      const Text("关注")
                    ],
                  ),
                  Image.asset('assets/images/right_img.png')
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                id = "3";
              });
            },
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [Image.asset('assets/images/hide_img.png'), const SizedBox(width: 20), const Text("隐藏")],
                  ),
                  Image.asset('assets/images/right_img.png')
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                id = "4";
              });
            },
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/shield_img.png'),
                      const SizedBox(width: 20),
                      const Text("禁止回复")
                    ],
                  ),
                  Image.asset('assets/images/right_img.png')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
