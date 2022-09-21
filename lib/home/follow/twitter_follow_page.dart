// 关注

import 'package:flutter/material.dart';
import 'package:flutter_base_pkg/widgets/my_refresh_list_widget.dart';
import 'package:provider/provider.dart';

import '../model/tweets_list_model.dart';
import '../recommend/twitter_list_item.dart';
import '../recommend/twitter_recommend_vm.dart';

class TwitterFollowPage extends StatefulWidget {
  const TwitterFollowPage({super.key});

  @override
  State<TwitterFollowPage> createState() => _TwitterFollowPageState();
}

class _TwitterFollowPageState extends State<TwitterFollowPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (content) => TwitterRecommendViewModel("follow"),
        builder: (context, _) {
          return Container(
            color: const Color(0xffEAF1FF),
            child: BaseRefreshListWidget<TwitterRecommendViewModel, TweetsListModel>(
              itemBuilder: (BuildContext context, int index, value) {
                return TwitterListItemView(
                  data: value,
                  likeCallBack: () {},
                );
              },
              enablePullUp: true,
            ),
          );
        });
  }
}
