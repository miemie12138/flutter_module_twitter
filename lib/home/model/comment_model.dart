class CommentModel {
  int? commentNum;
  String? content;
  int? createBy;
  int? createTime;
  int? forwardNumber;
  int? fromImUserId;
  String? fromImUserImage;
  String? fromImUserName;
  int? id;
  int? likeNumber;
  String? publishTime;
  List<ReplyDetailList>? replyDetailList;
  int? selfReply;
  int? twitterInfoId;
  int? updateBy;
  int? updateTime;
  int? version;

  CommentModel(
      {this.commentNum,
      this.content,
      this.createBy,
      this.createTime,
      this.forwardNumber,
      this.fromImUserId,
      this.fromImUserImage,
      this.fromImUserName,
      this.id,
      this.likeNumber,
      this.publishTime,
      this.replyDetailList,
      this.selfReply,
      this.twitterInfoId,
      this.updateBy,
      this.updateTime,
      this.version});
  static List<CommentModel> fromList(List<dynamic> json) {
    return json.map((e) => CommentModel.fromJson(e)).toList();
  }

  CommentModel.fromJson(Map<String, dynamic> json) {
    commentNum = json['commentNum'];
    content = json['content'];
    createBy = json['createBy'];
    createTime = json['createTime'];
    forwardNumber = json['forwardNumber'];
    fromImUserId = json['fromImUserId'];
    fromImUserImage = json['fromImUserImage'];
    fromImUserName = json['fromImUserName'];
    id = json['id'];
    likeNumber = json['likeNumber'];
    publishTime = json['publishTime'];
    if (json['replyDetailList'] != null) {
      replyDetailList = <ReplyDetailList>[];
      json['replyDetailList'].forEach((v) {
        replyDetailList?.add(ReplyDetailList.fromJson(v));
      });
    }
    selfReply = json['selfReply'];
    twitterInfoId = json['twitterInfoId'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    version = json['version'];
  }
}

class ReplyDetailList {
  int? commentNum;
  String? content;
  int? createBy;
  int? createTime;
  int? fromImUserId;
  String? fromImUserImage;
  String? fromImUserName;
  int? id;
  int? likeNumber;
  int? parentId;
  String? publishTime;
  int? replyId;
  int? selfReply;
  int? toImUserId;
  String? toImUserImage;
  String? toImUserName;
  int? updateBy;
  int? updateTime;
  int? version;

  ReplyDetailList(
      {this.commentNum,
      this.content,
      this.createBy,
      this.createTime,
      this.fromImUserId,
      this.fromImUserImage,
      this.fromImUserName,
      this.id,
      this.likeNumber,
      this.parentId,
      this.publishTime,
      this.replyId,
      this.selfReply,
      this.toImUserId,
      this.toImUserImage,
      this.toImUserName,
      this.updateBy,
      this.updateTime,
      this.version});

  ReplyDetailList.fromJson(Map<String, dynamic> json) {
    commentNum = json['commentNum'];
    content = json['content'];
    createBy = json['createBy'];
    createTime = json['createTime'];
    fromImUserId = json['fromImUserId'];
    fromImUserImage = json['fromImUserImage'];
    fromImUserName = json['fromImUserName'];
    id = json['id'];
    likeNumber = json['likeNumber'];
    parentId = json['parentId'];
    publishTime = json['publishTime'];
    replyId = json['replyId'];
    selfReply = json['selfReply'];
    toImUserId = json['toImUserId'];
    toImUserImage = json['toImUserImage'];
    toImUserName = json['toImUserName'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    version = json['version'];
  }
}
