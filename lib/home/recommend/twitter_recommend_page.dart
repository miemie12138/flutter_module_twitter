// 推荐

import 'package:flutter/cupertino.dart';
import 'package:flutter_base_pkg/my_navigator.dart';
import 'package:flutter_base_pkg/widgets/my_refresh_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:twitter/home/recommend/tweets_details_page.dart';
import 'package:twitter/home/recommend/twitter_list_item.dart';
import 'package:twitter/home/recommend/twitter_recommend_vm.dart';

import '../model/tweets_list_model.dart';

class TwitterRecommendPage extends StatefulWidget {
  const TwitterRecommendPage({super.key});

  @override
  State<TwitterRecommendPage> createState() => _TwitterRecommendPageState();
}

class _TwitterRecommendPageState extends State<TwitterRecommendPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (content) => TwitterRecommendViewModel("recommend"),
        builder: (context, _) {
          return Container(
            color: const Color(0xffEAF1FF),
            child: BaseRefreshListWidget<TwitterRecommendViewModel, TweetsListModel>(
              itemBuilder: (BuildContext context, int index, value) {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    MyNavigator.push(TweetsDetailsPageView(
                      id: value.id.toString(),
                    ));
                  },
                  child: TwitterListItemView(
                    data: value,
                    likeCallBack: () {},
                  ),
                );
              },
              enablePullUp: true,
            ),
          );
        });
  }
}
