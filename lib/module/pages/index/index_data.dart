class IndexData {
  IndexData({
      this.id,
      this.index,
      this.isActive,
      this.balance,
      this.picture,
      this.age,
      this.eyeColor,
      this.name,
      this.gender,
      this.company,
      this.email,
      this.phone,
      this.address,
      this.about,
      this.registered,
      this.latitude,
      this.longitude,});

  IndexData.fromJson(dynamic json) {
    id = json['_id'];
    index = json['index'];
    isActive = json['isActive'];
    balance = json['balance'];
    picture = json['picture'];
    age = json['age'];
    eyeColor = json['eyeColor'];
    name = json['name'];
    gender = json['gender'];
    company = json['company'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    about = json['about'];
    registered = json['registered'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
  String? id;
  int? index;
  bool? isActive;
  String? balance;
  String? picture;
  int? age;
  String? eyeColor;
  String? name;
  String? gender;
  String? company;
  String? email;
  String? phone;
  String? address;
  String? about;
  String? registered;
  double? latitude;
  double? longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['index'] = index;
    map['isActive'] = isActive;
    map['balance'] = balance;
    map['picture'] = picture;
    map['age'] = age;
    map['eyeColor'] = eyeColor;
    map['name'] = name;
    map['gender'] = gender;
    map['company'] = company;
    map['email'] = email;
    map['phone'] = phone;
    map['address'] = address;
    map['about'] = about;
    map['registered'] = registered;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    return map;
  }

}