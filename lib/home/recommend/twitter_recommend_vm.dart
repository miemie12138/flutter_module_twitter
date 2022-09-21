import 'package:flutter_base_pkg/widgets/my_refresh_list_widget.dart';
import 'package:flutter_base_pkg/widgets/my_status_widget.dart';

import '../services/twitter_service.dart';

class TwitterRecommendViewModel extends BaseRefreshListViewModel {
  String keyWord = '';
  String type = 'follow'; //follow ：关注 recommend：推荐
  TwitterRecommendViewModel(this.type) {
    status = MyStatusEnum.loading;
    loadData(true);
  }

  @override
  loadData([bool refresh = false]) {
    super.loadData(refresh);
    TwitterService.loadData({...pageParams}).then((value) {
      setupData(refresh: refresh, value: value);
    }).catchError((e) {
      setupData(error: true, refresh: refresh);
    });
  }
}
