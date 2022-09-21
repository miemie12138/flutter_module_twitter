class FollowListModel {
  String? avatar;
  String? cancelTime;
  int? createBy;
  int? createTime;
  int? id;
  bool? isFollowed;
  String? nickname;
  String? profile;
  String? status;
  String? type;
  String? typeDesc;
  int? updateBy;
  int? updateTime;
  String? userLevel;
  int? version;

  FollowListModel(
      {this.avatar,
        this.cancelTime,
        this.createBy,
        this.createTime,
        this.id,
        this.isFollowed,
        this.nickname,
        this.profile,
        this.status,
        this.type,
        this.typeDesc,
        this.updateBy,
        this.updateTime,
        this.userLevel,
        this.version});
  static List<FollowListModel> fromList(List<dynamic> json) {
    return json.map((e) => FollowListModel.fromJson(e)).toList();
  }
  FollowListModel.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    cancelTime = json['cancelTime'];
    createBy = json['createBy'];
    createTime = json['createTime'];
    id = json['id'];
    isFollowed = json['isFollowed']??false;
    nickname = json['nickname'];
    profile = json['profile'];
    status = json['status'];
    type = json['type'];
    typeDesc = json['typeDesc'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    userLevel = json['userLevel'];
    version = json['version'];
  }
}