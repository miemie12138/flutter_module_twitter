import 'package:flutter_base_pkg/http/my_http.dart';
import 'package:twitter/home/model/comment_model.dart';

import '../model/follow_list_model.dart';
import '../model/tweets_detail_model.dart';
import '../model/tweets_list_model.dart';

class TwitterService {
  TwitterService._();
  static String serverHostProd = 'https://chat.fbixfbi.com';

  ///登录
  static Future<String> login(Map<String, dynamic> params) async {
    final response = await MyHttp.post('$serverHostProd/app/v1/debug/login', data: params, hideToast: true);
    if (response.code == "200") {
      return response.data['token'];
    }
    return '';
  }

  ///获取列表数据
  static Future<List<TweetsListModel>> loadData(Map<String, dynamic> params) async {
    // final response = await MyHttp.post('$serverHostProd/app/v1/twitter/query/any/page', data: params);
    final result = [
      {
        "commentNum": 145,
        "content": "区块链消息",
        "createBy": 1343563112468447232,
        "createTime": 1343563112468447232,
        "forwardNumber": 145,
        "id": 1343563112468447232,
        "imUserId": 123456789,
        "imUserImage": "http://img3.newmotor.com.cn/UploadFiles/2019-12/66415/2019122015413613499.jpg",
        "imUserName": "松哥",
        "likeNumber": 145,
        "liked": 1,
        "publishTime": "10分钟前",
        "resourceDtoList": [
          {"imageUrl": "123", "sort": 123}
        ],
        "updateBy": 1343563112468447232,
        "updateTime": 1343563112468447232,
        "version": 1343563112468447232
      },
      {
        "commentNum": 145,
        "content": "区块链消息",
        "createBy": 1343563112468447232,
        "createTime": 1343563112468447232,
        "forwardNumber": 145,
        "id": 1343563112468447232,
        "imUserId": 123456789,
        "imUserImage": "http://img3.newmotor.com.cn/UploadFiles/2019-12/66415/2019122015413613499.jpg",
        "imUserName": "松哥",
        "likeNumber": 145,
        "liked": 1,
        "publishTime": "10分钟前",
        "resourceDtoList": [
          {"imageUrl": "123", "sort": 123}
        ],
        "updateBy": 1343563112468447232,
        "updateTime": 1343563112468447232,
        "version": 1343563112468447232
      }
    ];
    return TweetsListModel.fromList(result);
  }

  ///获取关注列表数据
  static Future<List<FollowListModel>> loadFollowData(Map<String, dynamic> params) async {
    // final response = await MyHttp.post('$serverHostProd/app/v1/twitter/followList', data: params);
    final result = [
      {
        "avatar": "",
        "cancelTime": "",
        "createBy": 1343563112468447232,
        "createTime": 1343563112468447232,
        "id": 1343563112468447232,
        "isFollowed": true,
        "nickname": "哈哈哈哈还好",
        "profile": "哈哈哈哈还好哈哈哈哈还好哈哈哈哈还好哈哈哈哈还好哈哈哈哈还好",
        "status": "",
        "type": "",
        "typeDesc": "",
        "updateBy": 1343563112468447232,
        "updateTime": 1343563112468447232,
        "userLevel": "",
        "version": 1343563112468447232
      },
      {
        "avatar": "",
        "cancelTime": "",
        "createBy": 1343563112468447232,
        "createTime": 1343563112468447232,
        "id": 1343563112468447232,
        "isFollowed": false,
        "nickname": "哈哈哈哈还好",
        "profile": "哈哈哈哈还好哈哈哈哈还好哈哈哈哈还好哈哈哈哈还好哈哈哈哈还好",
        "status": "",
        "type": "",
        "typeDesc": "",
        "updateBy": 1343563112468447232,
        "updateTime": 1343563112468447232,
        "userLevel": "",
        "version": 1343563112468447232
      }
    ];
    return FollowListModel.fromList(result);
  }

  ///获取帖子详情
  static Future<TweetsDetailsModel> tweetsDetails(Map<String, dynamic> params) async {
    // final response = await MyHttp.post('$serverHostProd/app/v1/twitter/detail', data: params);
    final result = {
      "commentNum": 145,
      "content": "区块链消息",
      "createBy": 1343563112468447232,
      "createTime": 1343563112468447232,
      "forwardNumber": 145,
      "id": 1343563112468447232,
      "imUserId": 123456789,
      "imUserImage": "http://img3.newmotor.com.cn/UploadFiles/2019-12/66415/2019122015413613499.jpg",
      "imUserName": "松哥",
      "likeNumber": 145,
      "liked": 1,
      "publishTime": "10分钟前",
      "resourceDtoList": [
        {"imageUrl": "123", "sort": 123}
      ],
      "updateBy": 1343563112468447232,
      "updateTime": 1343563112468447232,
      "version": 1343563112468447232
    };

    return TweetsDetailsModel.fromJson(result);
  }

  ///获取帖子一级评论
  static Future<List<CommentModel>> getCommentList(Map<String, dynamic> params) async {
    // final response = await MyHttp.post('$serverHostProd//app/v1/twitter/comment/page', data: params);
    final result = [
      {
        "commentNum": 145,
        "content": "这就是他的评论内容",
        "createBy": 1343563112468447232,
        "createTime": 1343563112468447232,
        "forwardNumber": 145,
        "fromImUserId": 145,
        "fromImUserImage": "http://img3.newmotor.com.cn/UploadFiles/2019-12/66415/2019122015413613499.jpg",
        "fromImUserName": "松林",
        "id": 1343563112468447232,
        "likeNumber": 145,
        "publishTime": "10分钟前",
        "replyDetailList": [
          {
            "commentNum": 145,
            "content": "这就是他的评论内容",
            "createBy": 1343563112468447232,
            "createTime": 1343563112468447232,
            "fromImUserId": 145,
            "fromImUserImage": "http://img3.newmotor.com.cn/UploadFiles/2019-12/66415/2019122015413613499.jpg",
            "fromImUserName": "松林",
            "id": 1343563112468447232,
            "likeNumber": 145,
            "parentId": 12131,
            "publishTime": "10分钟前",
            "replyId": 1231231,
            "selfReply": 1,
            "toImUserId": 1231231,
            "toImUserImage": "http://img3.newmotor.com.cn/UploadFiles/2019-12/66415/2019122015413613499.jpg",
            "toImUserName": "松林",
            "updateBy": 1343563112468447232,
            "updateTime": 1343563112468447232,
            "version": 1343563112468447232
          }
        ],
        "selfReply": 1,
        "twitterInfoId": 0,
        "updateBy": 1343563112468447232,
        "updateTime": 1343563112468447232,
        "version": 1343563112468447232
      }
    ];

    return CommentModel.fromList(result);
  }
}
