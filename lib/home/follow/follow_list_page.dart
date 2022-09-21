// 关注列表

import 'package:flutter/material.dart';
import 'package:flutter_base_pkg/widgets/my_refresh_list_widget.dart';
import 'package:flutter_base_pkg/widgets/my_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:twitter/home/follow/follow_list_item.dart';

import '../../l10n/local.dart';
import '../model/follow_list_model.dart';
import 'follow_list_vm.dart';

class FollowListPage extends StatefulWidget {
  const FollowListPage({super.key});

  @override
  State<FollowListPage> createState() => _FollowListPageState();
}

class _FollowListPageState extends State<FollowListPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (content) => FollowListViewModel(),
        builder: (context, _) {
          return MyScaffold(
            title: L.twitter_home_page_follow,
            body: Container(
              color: Colors.white,
              child: BaseRefreshListWidget<FollowListViewModel, FollowListModel>(
                itemBuilder: (BuildContext context, int index, value) {
                  return FollowListItemView(
                    data: value,
                  );
                },
                enablePullUp: true,
              ),
            ),
          );
        });
  }
}
