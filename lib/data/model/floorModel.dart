class FloorsModel {
  int? id;
  String? name;
  int? number;
  int? mallID;
  String? image;

  FloorsModel({
    this.id,
    this.name,
    this.number,
    this.mallID,
    this.image,
  });

  FloorsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    mallID = json['mallID'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    data['mallID'] = this.mallID;
    data['image'] = this.image;

    return data;
  }
}
