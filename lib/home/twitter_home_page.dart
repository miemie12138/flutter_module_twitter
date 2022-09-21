import 'package:flutter/material.dart';
import 'package:flutter_base_pkg/my_navigator.dart';
import 'package:twitter/home/recommend/twitter_recommend_page.dart';
import 'package:twitter/home/release/release_post_page.dart';
import 'package:twitter/home/services/twitter_service.dart';
import 'package:twitter/manager/user_manager.dart';

import '../l10n/local.dart';
import '../manager/event_manager.dart';
import 'follow/twitter_follow_page.dart';
import 'main_init.dart';

class TwitterHomePage extends StatefulWidget {
  const TwitterHomePage({super.key});

  @override
  State<TwitterHomePage> createState() => _TwitterHomePageState();
}

class _TwitterHomePageState extends State<TwitterHomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    MainInit.setup(context);
    _tabController = TabController(length: 2, vsync: this);
    TwitterService.login({
      "address": "0xea281705743cc64c223164e24fcfbb64dbf4ba84",
      "chainCode": "BNB_CHAIN",
      "content": "",
      "signMessage": ""
    }).then((value) {
      UserManager.token = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<Object>(
          stream: EventManager.languageChangeNotifaction,
          builder: (context, snapshot) {
            return _buildTabBar();
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [TwitterFollowPage(), TwitterRecommendPage()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => MyNavigator.push(const ReleasePostPage()),
        mini: true,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTabBar() {
    final List<String> tabs = <String>[L.twitter_home_page_follow, L.twitter_home_page_recommend];
    return SizedBox(
      height: 40,
      child: TabBar(
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: const Color(0xFF2DC3B5),
        isScrollable: false,
        labelStyle: const TextStyle(fontSize: 18),
        labelColor: const Color(0xFF2DC3B5),
        unselectedLabelColor: const Color(0xff6E6E6E),
        unselectedLabelStyle: const TextStyle(fontSize: 18),
        tabs: tabs.map((e) => Tab(child: Text(e))).toList(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
