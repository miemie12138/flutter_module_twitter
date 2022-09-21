import 'package:flutter/material.dart';

import '../model/follow_list_model.dart';
import '../widgets/my_clip_circle_weight.dart';

class FollowListItemView extends StatefulWidget {
  final FollowListModel? data;

  const FollowListItemView({Key? key, this.data}) : super(key: key);

  @override
  State<FollowListItemView> createState() => _FollowListItemViewState();
}

class _FollowListItemViewState extends State<FollowListItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 17, right: 10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyClipCircleWeight(
            headImg: widget.data?.avatar ?? '',
            size: 54,
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data?.nickname ?? "",
                          style: const TextStyle(fontSize: 16, color: Color(0xff2C2C2C)),
                        ),
                        Text(
                          widget.data?.nickname ?? "",
                          style: const TextStyle(fontSize: 12, color: Color(0xffC9C9C9)),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.data!.isFollowed = !(widget.data!.isFollowed!);
                        });
                      },
                      child: Container(
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
                    )
                  ],
                ),
                Text(
                  widget.data?.profile ?? "",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff39444E),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                const Divider(
                  thickness: 0.5,
                  height: 0.5,
                  color: Color(0xffEAF1FF),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
