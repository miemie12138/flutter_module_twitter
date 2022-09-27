import 'package:flutter_base_pkg/widgets/my_status_widget.dart';
import 'package:flutter_base_pkg/widgets/my_viewmodel_status_widget.dart';
import 'package:twitter/home/services/twitter_service.dart';

import '../model/comment_model.dart';
import '../model/tweets_detail_model.dart';

class TweetsDetailsPageViewModel extends BaseViewModel {
  TweetsDetailsModel? detailModel;
  String id;
  List<CommentModel>? commentList = [];
  int page = 1;
  int pageSize = 10;
  String content = '';

  // 获取分页参数
  Map<String, dynamic> get pageParams {
    return {"page": page, "size": pageSize};
  }

  TweetsDetailsPageViewModel(this.id) {
    status = MyStatusEnum.loading;

    loadData();
    loadCommentData(refresh: true);
  }

  ///刷新
  refreshData() {
    loadData();
    loadCommentData(refresh: true);
  }

  ///加载详情数据
  loadData() {
    TwitterService.tweetsDetails({'id': id}).then((value) {
      detailModel = value;
      status = MyStatusEnum.normal;
    }).catchError((e) {
      status = MyStatusEnum.emptyData;
    }).whenComplete(() {
      notifyListeners();
    });
    TwitterService.getCommentList({'id': id}).then((value) {
      commentList = value;
      notifyListeners();
    });
  }

  //删除评论
  deleteReply(int index, String replyId) {}

  ///评论列表
  loadCommentData({bool refresh = false}) {}

  ///点赞和取消点赞
  doLike(String memberId) {}

  //删除动态
  deletePost() {}

  //投诉动态
  complaintPost() {}

//拉黑
  blacklistPost() {}

  ///评论和回复
  reply(String replyId, int index, String fromMemberType, String fromMemberId) {}

  @override
  void onStatusTap(MyStatusEnum value) {
    loadData();
    loadCommentData(refresh: true);
  }
}
