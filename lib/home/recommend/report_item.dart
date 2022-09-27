import 'package:flutter/material.dart';

import '../model/comment_model.dart';
import '../widgets/my_clip_circle_weight.dart';

class ReportItem extends StatelessWidget {
  final ReplyDetailList? model;
  final String? id;
  final Function? refreshCallBack;
  const ReportItem({Key? key, this.model, this.id, this.refreshCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const MyClipCircleWeight(
                headImg: '',
                size: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(
                  model?.fromImUserName ?? "",
                  style: const TextStyle(fontSize: 14, color: Color(0xff393734), fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 40, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model?.content ?? "",
                  style: const TextStyle(fontSize: 14, color: Color(0xff393734)),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      model?.publishTime ?? "",
                      style: const TextStyle(fontSize: 11, color: Color(0xffBEBEBE)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: Image.asset(
                                'assets/images/reply.png',
                                width: 15,
                                height: 15,
                              ),
                              onTap: () {},
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 3),
                              child: Text(model?.commentNum.toString() ?? '',
                                  style: const TextStyle(fontSize: 11, color: Color(0xff393734))),
                            ),
                          ],
                        ),
                        const SizedBox(width: 7),
                        Row(
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              child: Image.asset(
                                'assets/images/love_grey.png',
                                width: 15,
                                height: 15,
                              ),
                              onTap: () {},
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 3),
                              child: Text((model?.likeNumber!).toString(),
                                  style: const TextStyle(fontSize: 11, color: Color(0xff393734))),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(
                  thickness: 0.5,
                  height: 0.5,
                  color: Color(0xfff7f7f7),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
