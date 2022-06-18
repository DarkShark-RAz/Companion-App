import 'dart:convert';

VideoModel videoModelFromJson(String str) =>
    VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  VideoModel({
    this.items,
    this.nextPageToken,
  });

  String? nextPageToken;
  List<Item>? items;

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        nextPageToken: json["nextPageToken"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nextPageToken": nextPageToken,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.snippet,
  });

  Snippet? snippet;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        snippet: Snippet.fromJson(json["snippet"]),
      );

  Map<String, dynamic> toJson() => {
        "snippet": snippet?.toJson(),
      };
}

class Snippet {
  Snippet({
    this.publishedAt,
    this.title,
    this.description,
    this.thumbnails,
    this.resourceId,
  });

  DateTime? publishedAt;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  ResourceId? resourceId;

  Map<String, dynamic> toJson() => {
        "publishedAt": publishedAt?.toIso8601String(),
        "title": title,
        "description": description,
        "thumbnails": thumbnails!.toJson(),
        "resourceId": resourceId!.toJson(),
      };

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromJson(
          json["thumbnails"],
        ),
        resourceId: ResourceId.fromJson(json["resourceId"]),
      );
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  Default? thumbnailsDefault;
  Default? medium;
  Default? high;
  Default? standard;
  Default? maxres;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
        standard: json["standard"] == null
            ? null
            : Default.fromJson(json["standard"]),
        maxres:
            json["maxres"] == null ? null : Default.fromJson(json["maxres"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault?.toJson(),
        "medium": medium?.toJson(),
        "high": high?.toJson(),
        "standard": standard == null ? null : standard?.toJson(),
        "maxres": maxres == null ? null : maxres?.toJson(),
      };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String? url;
  int? width;
  int? height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class ResourceId {
  ResourceId({
    this.videoId,
  });

  String? videoId;

  factory ResourceId.fromJson(Map<String, dynamic> json) => ResourceId(
        videoId: json["videoId"],
      );

  Map<String, dynamic> toJson() => {
        "videoId": videoId,
      };
}
