class ClassificationDetailsModel {
  List<String> classification;

  ClassificationDetailsModel({this.classification});

  ClassificationDetailsModel.fromJson(Map<String, dynamic> json) {
    classification = json['classification'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classification'] = this.classification;
    return data;
  }
}
