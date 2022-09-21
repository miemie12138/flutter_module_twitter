class ImageModel {
  ImageModel({
    required this.resourceId,
    required this.resourceUrl,
  });

  String resourceId;
  String resourceUrl;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        resourceId: json["resourceId"] ?? '',
        resourceUrl: json["resourceUrl"] ?? '',
      );

  get path => null;
  static List<ImageModel> fromList(List<dynamic> json) {
    return json.map((e) => ImageModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        "resourceId": resourceId,
        "resourceUrl": resourceUrl,
      };
}
