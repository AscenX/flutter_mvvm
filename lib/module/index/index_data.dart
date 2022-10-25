class IndexData {
  IndexData({
    this.id,
    this.title,
    this.content,
    this.testData,});

  IndexData.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    testData = json['testData'];
  }
  int? id;
  String? title;
  String? content;
  String? testData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['content'] = content;
    map['testData'] = testData;
    return map;
  }

}