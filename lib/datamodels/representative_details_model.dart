class RepresentativeDetailsModel {
  String imageURL;
  List<String> infoArr;
  int parameters;

  RepresentativeDetailsModel({this.imageURL, this.infoArr, this.parameters});

  RepresentativeDetailsModel.fromJson(Map<String, dynamic> json) {
    imageURL = json['imageURL'];
    infoArr = json['infoArr'].cast<String>();
    parameters = json['parameters'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageURL'] = this.imageURL;
    data['infoArr'] = this.infoArr;
    data['parameters'] = this.parameters;
    return data;
  }
}
