import 'package:flutter/material.dart';
import 'package:twitter/home/widgets/tweets_more_dialog.dart';

import '../model/tweets_list_model.dart';
import '../widgets/my_cached_network_image.dart';
import '../widgets/my_clip_circle_weight.dart';

class TwitterListItemView extends StatelessWidget {
  final TweetsListModel? data;
  final Function? likeCallBack;

  const TwitterListItemView({Key? key, this.data, this.likeCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.white,
      padding: const EdgeInsets.all(17),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 13),
            child: MyClipCircleWeight(
              headImg: data?.imUserImage ?? '',
              size: 54,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 5),
                          child: Text(
                            data?.imUserName ?? "",
                            style: const TextStyle(fontSize: 14, color: Color(0xff393734)),
                          ),
                        ),
                        Text(
                          data?.imUserName ?? "",
                          style: const TextStyle(fontSize: 13, color: Color(0xff919191)),
                        ),
                      ],
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
                                      name: data?.imUserName,
                                      uId: data?.imUserId,
                                      id: data?.id,
                                    );
                                  });
                            }),
                            child: Image.asset("assets/images/right_img.png")))
                  ],
                ),
                Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Text(
                      data?.content ?? "",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                Visibility(
                  visible: data?.resourceDtoList != null && (data?.resourceDtoList!.length)! > 0,
                  child: UnconstrainedBox(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 150,
                      constraints: const BoxConstraints(minWidth: 150),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        child: MyCachedNetworkImage(data?.resourceDtoList?[0].imageUrl ?? '', size: 400),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child:
                                Image.asset(data?.liked == 0 ? 'assets/images/reply.png' : 'assets/images/reply.png'),
                            onTap: () {
                              likeCallBack?.call();
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Text(data?.commentNum.toString() ?? '',
                                style: const TextStyle(fontSize: 11, color: Color(0xff393734))),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: Image.asset(
                                data?.liked == 0 ? 'assets/images/forward.png' : 'assets/images/forward.png'),
                            onTap: () {
                              likeCallBack?.call();
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Text(data?.commentNum.toString() ?? '',
                                style: const TextStyle(fontSize: 11, color: Color(0xff393734))),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: Image.asset(
                                data?.liked == 0 ? 'assets/images/love_grey.png' : 'assets/images/love_grey.png'),
                            onTap: () {
                              likeCallBack?.call();
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: Text((data?.likeNumber!).toString(),
                                style: const TextStyle(fontSize: 11, color: Color(0xff393734))),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
