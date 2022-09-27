import 'package:flutter/material.dart';
import 'package:flutter_base_pkg/widgets/my_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:twitter/home/recommend/tweets_details_page_vm.dart';
import 'package:twitter/home/recommend/twitter_details_item.dart';

import '../../shared/my_toast.dart';
import '../model/comment_model.dart';
import 'comment_item.dart';

class TweetsDetailsPageView extends StatelessWidget {
  final String? id;

  const TweetsDetailsPageView({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => TweetsDetailsPageViewModel(id ?? ''),
        builder: (context, _) {
          final vm = Provider.of<TweetsDetailsPageViewModel>(context);
          return MyScaffold(
              title: '详情',
              body: Container(
                color: const Color(0xffEAF1FF),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: TwitterDetailsItemView(
                        data: vm.detailModel,
                        likeCallBack: () {},
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('评论(${vm.detailModel?.commentNum ?? 0})',
                                    style: const TextStyle(fontSize: 14, color: Color(0xff393734))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: ListView.builder(
                        itemCount: vm.commentList?.length ?? 0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () async {},
                            child: Column(
                              children: [
                                CommentItem(
                                  model: vm.commentList?[index],
                                  id: id,
                                  refreshCallBack: () {
                                    vm.refreshData();
                                  },
                                ),
                                const Divider(
                                  thickness: 0.5,
                                  height: 0.5,
                                  color: Color(0xfff7f7f7),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ));
        });
  }

  ///弹出输入框
  showComment(BuildContext contexts, CommentModel? reportUser, int index, String fromMemberType, String fromMemberId) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: contexts,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                Visibility(
                  visible: reportUser == null,
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(9),
                    decoration:
                        const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '回复',
                          style: TextStyle(fontSize: 14, color: Color(0xffBEBEBE)),
                        ),
                        const Text(
                          ' ',
                          style: TextStyle(fontSize: 14, color: Color(0xff393734), fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: Text(
                            reportUser?.content ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14, color: Color(0xff393734)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Row(
                    children: [
                      const Text(
                        '评论',
                        style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: TextField(
                            keyboardType: TextInputType.multiline,
                            autofocus: true,
                            maxLines: 5,
                            minLines: 1,
                            maxLength: 150,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                            decoration: const InputDecoration(
                                isCollapsed: true,
                                counterText: '',
                                fillColor: Color(0xffF7F7F7),
                                filled: true,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffBEBEBE),
                                ),
                                enabledBorder:
                                    OutlineInputBorder(borderSide: BorderSide(color: Color(0xffEEEEEE), width: 0.5)),
                                focusedBorder:
                                    OutlineInputBorder(borderSide: BorderSide(color: Color(0xffEEEEEE), width: 0.5))),
                            onChanged: (value) {
                              if (value.length > 149) {
                                MyToast.show('评论和回复最多输入150个字');
                              }
                              contexts.read<TweetsDetailsPageViewModel>().content = value;
                            },
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {},
                        child: Container(
                          height: 35,
                          width: 60,
                          decoration: const BoxDecoration(
                              color: Color(0xff222831), borderRadius: BorderRadius.all(Radius.circular(3))),
                          child: const Center(
                            child: Text(
                              '发送',
                              style: TextStyle(fontSize: 16, color: Color(0xffFFD475), fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
