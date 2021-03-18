class City {
  int id;
  String  name;
  City(
      {this.id,
        this.name,
       });

  factory City.fromJson(Map<dynamic, dynamic> json) {
    return City(
        id: json['cID'],
        name: json['cName'],
     );
  }

  Map<String, dynamic> toJson() {
    return {
      "cID": id,
      "cName": name,

    };
  }
}