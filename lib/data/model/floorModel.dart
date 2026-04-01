class FloorsModel {
  int? id;
  String? name;
  int? number;
  int? mallID;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<Media>? media;

  FloorsModel(
      {this.id,
      this.name,
      this.number,
      this.mallID,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  FloorsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    mallID = json['mallID'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(new Media.fromJson(v));
      });
    }
  }

  // 🔥 أهم جزء (الصورة)
  String? get imageUrl {
    if (media!.isNotEmpty) {
      return media?[0].url;
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    data['mallID'] = this.mallID;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.media != null) {
      data['media'] = this.media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Media {
  int? id;
  String? mediableType;
  int? mediableID;
  String? fileType;
  String? url;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Media(
      {this.id,
      this.mediableType,
      this.mediableID,
      this.fileType,
      this.url,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediableType = json['mediableType'];
    mediableID = json['mediableID'];
    fileType = json['fileType'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mediableType'] = this.mediableType;
    data['mediableID'] = this.mediableID;
    data['fileType'] = this.fileType;
    data['url'] = this.url;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
