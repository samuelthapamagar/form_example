class FormModel {
  int? id;
  String? title;
  String? description;
  String? type;

  FormModel({this.id, this.title, this.description, this.type});

  FormModel.fromJson(Map<String, dynamic> json) {
    id =json['id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    return data;
  }
}