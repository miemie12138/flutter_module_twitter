import 'package:flutter_base_pkg/widgets/my_refresh_list_widget.dart';
import 'package:flutter_base_pkg/widgets/my_status_widget.dart';

import '../services/twitter_service.dart';

class FollowListViewModel extends BaseRefreshListViewModel {
  FollowListViewModel() {
    status = MyStatusEnum.loading;
    loadData(true);
  }

  @override
  loadData([bool refresh = false]) {
    super.loadData(refresh);
    TwitterService.loadFollowData({...pageParams}).then((value) {
      setupData(refresh: refresh, value: value);
    }).catchError((e) {
      setupData(error: true, refresh: refresh);
    });
  }
}
