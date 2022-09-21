import 'package:flutter/material.dart';
import 'package:twitter/home/widgets/tweets_more_dialog.dart';

import '../model/tweets_detail_model.dart';
import '../widgets/my_cached_network_image.dart';
import '../widgets/my_clip_circle_weight.dart';

class TwitterDetailsItemView extends StatefulWidget {
  final TweetsDetailsModel? data;
  final Function? likeCallBack;

  const TwitterDetailsItemView({Key? key, this.data, this.likeCallBack}) : super(key: key);

  @override
  State<TwitterDetailsItemView> createState() => _TwitterDetailsItemViewState();
}

class _TwitterDetailsItemViewState extends State<TwitterDetailsItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 13),
                    child: MyClipCircleWeight(
                      headImg: widget.data?.imUserImage ?? '',
                      size: 54,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 5),
                        child: Text(
                          widget.data?.imUserName ?? "",
                          style: const TextStyle(fontSize: 14, color: Color(0xff393734)),
                        ),
                      ),
                      Text(
                        widget.data?.imUserName ?? "",
                        style: const TextStyle(fontSize: 13, color: Color(0xff919191)),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 52,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: widget.data?.isFollowed ?? false ? Colors.white : const Color(0xff37ECBA),
                      border: Border.all(width: 1, color: const Color(0xff2DC3B5)),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Text(
                      widget.data?.isFollowed ?? false ? '已关注' : '关注',
                      style: TextStyle(
                        fontSize: 12,
                        color: widget.data?.isFollowed ?? false ? const Color(0xff2DC3B5) : Colors.white,
                      ),
                    ),
                  ),
                  Visibility(
                      visible: true,
                      child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: (() {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return TweetsMoreDialog(
                                    name: widget.data?.imUserName,
                                    uId: widget.data?.imUserId,
                                    id: widget.data?.id,
                                  );
                                });
                          }),
                          child: Image.asset("assets/images/right_img.png"))),
                ],
              )
            ],
          ),
          Container(
              margin: const EdgeInsets.only(top: 15),
              child: Text(
                widget.data?.content ?? "",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
          Visibility(
            visible: widget.data?.resourceDtoList != null && (widget.data?.resourceDtoList!.length)! > 0,
            child: UnconstrainedBox(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                height: 150,
                constraints: const BoxConstraints(minWidth: 150),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: MyCachedNetworkImage(widget.data?.resourceDtoList?[0].imageUrl ?? '', size: 400),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child:
                          Image.asset(widget.data?.liked == 0 ? 'assets/images/reply.png' : 'assets/images/reply.png'),
                      onTap: () {
                        widget.likeCallBack?.call();
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(widget.data?.commentNum.toString() ?? '',
                          style: const TextStyle(fontSize: 11, color: Color(0xff393734))),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Image.asset(
                          widget.data?.liked == 0 ? 'assets/images/forward.png' : 'assets/images/forward.png'),
                      onTap: () {
                        widget.likeCallBack?.call();
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(widget.data?.commentNum.toString() ?? '',
                          style: const TextStyle(fontSize: 11, color: Color(0xff393734))),
                    ),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: Image.asset(
                          widget.data?.liked == 0 ? 'assets/images/love_grey.png' : 'assets/images/love_grey.png'),
                      onTap: () {
                        widget.likeCallBack?.call();
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text((widget.data?.likeNumber!).toString(),
                          style: const TextStyle(fontSize: 11, color: Color(0xff393734))),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
