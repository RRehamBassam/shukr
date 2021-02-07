class User {
  int id;
  String  name, phone, password, email, profileImageUrl, token;
  User(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.password,
        this.profileImageUrl,
        this.token});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
        id: json['cID'],
        name: json['cName'],
        phone: json['cPhone'],
        email: json['cEmail'],
        password: json['cPassword'],
        profileImageUrl: json['cProfileImageUrl'] ?? '',
        token: json['token_ID'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      "cID": id,
      "cName": name,
      "cPhone": phone,
      "cEmail": email,
      "cPassword": password,
      "cProfileImageUrl": profileImageUrl ?? '',
      "token_ID": token ?? ''
    };
  }
}
