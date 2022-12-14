

class Days {
  int? id;
  String? key;
  String? type;
  String? name;
  String? value;
  String? createdAt;
  String? updatedAt;


  Days.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    key = json['key'];
    type = json['type'];
    name = json['name'];
    value = json['value'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['type'] = this.type;
    data['name'] = this.name;
    data['value'] = this.value;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

