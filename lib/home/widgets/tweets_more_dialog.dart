import 'package:flutter/material.dart';

class TweetsMoreDialog extends StatefulWidget {
  final String? name;
  final int? uId, id;
  const TweetsMoreDialog({Key? key, this.name, this.id, this.uId}) : super(key: key);

  @override
  BottomState createState() => BottomState();
}

class BottomState extends State<TweetsMoreDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 23, right: 23, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/interest_img.png'),
                      const SizedBox(width: 20),
                      const Text("对这条推文不感兴趣")
                    ],
                  ),
                  Image.asset('assets/images/right_img.png')
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
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
                      Text("关注@${widget.name ?? ""}")
                    ],
                  ),
                  Image.asset('assets/images/right_img.png')
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/hide_img.png'),
                      const SizedBox(width: 20),
                      Text("隐藏@${widget.name ?? ""}")
                    ],
                  ),
                  Image.asset('assets/images/right_img.png')
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
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
                      Text("屏蔽@${widget.name ?? ""}")
                    ],
                  ),
                  Image.asset('assets/images/right_img.png')
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/report_img.png'),
                      const SizedBox(width: 20),
                      const Text("举报推文")
                    ],
                  ),
                  Image.asset('assets/images/right_img.png')
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/delete_img.png'),
                      const SizedBox(width: 20),
                      const Text("删除推文")
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
