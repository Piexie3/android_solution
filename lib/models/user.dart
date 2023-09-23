class User {
  int? type;
  String? name;
  String? email;
  String? avatar;
  String? description;
  String? openid;
  String? phone;
  int? online;

  User({
    this.type,
    this.name,
    this.email,
    this.avatar,
    this.description,
    this.openid,
    this.phone,
    this.online,
  });

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "email": email,
        "photourl": avatar,
        "description": description,
        "openid": openid,
        "phone": phone,
        "online": online,
      };
}
