import 'package:flutter/material.dart';
import 'package:twitter/home/recommend/report_item.dart';

import '../model/comment_model.dart';
import '../widgets/my_clip_circle_weight.dart';

class CommentItem extends StatelessWidget {
  final CommentModel? model;
  final String? id;
  final Function? refreshCallBack;
  final String? type;
  const CommentItem({Key? key, this.model, this.id, this.type, this.refreshCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              MyClipCircleWeight(
                headImg: model?.fromImUserImage ?? "",
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
                Expanded(
                  child: SliverList(
                      delegate: SliverChildBuilderDelegate((content, index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {},
                      child: Column(
                        children: [
                          ReportItem(
                            model: model?.replyDetailList?[index],
                            id: id,
                            refreshCallBack: () {},
                          ),
                          const Divider(
                            thickness: 0.5,
                            height: 0.5,
                            color: Color(0xfff7f7f7),
                          )
                        ],
                      ),
                    );
                  }, childCount: ((model?.replyDetailList?.length) ?? 0) > 2 ? 2 : model?.replyDetailList?.length)),
                ),
                Visibility(
                    visible: (model?.replyDetailList?.length)! > 0,
                    child: Column(
                      children: const [
                        SizedBox(height: 5),
                        Text(
                          '查看全部评论回复',
                          style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 55, 206, 236)),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
