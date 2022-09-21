class TweetsListModel {
  int? commentNum;
  String? content;
  int? createBy;
  int? createTime;
  int? forwardNumber;
  int? id;
  int? imUserId;
  String? imUserImage;
  String? imUserName;
  int? likeNumber;
  int? liked;
  String? publishTime;
  List<ResourceDtoList>? resourceDtoList;
  int? updateBy;
  int? updateTime;
  int? version;

  TweetsListModel(
      {this.commentNum,
      this.content,
      this.createBy,
      this.createTime,
      this.forwardNumber,
      this.id,
      this.imUserId,
      this.imUserImage,
      this.imUserName,
      this.likeNumber,
      this.liked,
      this.publishTime,
      this.resourceDtoList,
      this.updateBy,
      this.updateTime,
      this.version});
  static List<TweetsListModel> fromList(List<dynamic> json) {
    return json.map((e) => TweetsListModel.fromJson(e)).toList();
  }

  TweetsListModel.fromJson(Map<String, dynamic> json) {
    commentNum = json['commentNum'];
    content = json['content'];
    createBy = json['createBy'];
    createTime = json['createTime'];
    forwardNumber = json['forwardNumber'];
    id = json['id'];
    imUserId = json['imUserId'];
    imUserImage = json['imUserImage'];
    imUserName = json['imUserName'];
    likeNumber = json['likeNumber'] ?? "0";
    liked = json['liked'];
    publishTime = json['publishTime'];
    if (json['resourceDtoList'] != null) {
      resourceDtoList = <ResourceDtoList>[];
      json['resourceDtoList'].forEach((v) {
        resourceDtoList?.add(ResourceDtoList.fromJson(v));
      });
    }
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    version = json['version'];
  }
}

class ResourceDtoList {
  String? imageUrl;
  int? sort;

  ResourceDtoList({this.imageUrl, this.sort});

  ResourceDtoList.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    sort = json['sort'];
  }
}
