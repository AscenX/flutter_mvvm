class UserInfo {
  UserInfo({
      required this.username,
      required this.token,});

  UserInfo.fromJson(dynamic json) {
    username = json['username'];
    token = json['token'];
  }
  late String username;
  late String token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['token'] = token;
    return map;
  }

}