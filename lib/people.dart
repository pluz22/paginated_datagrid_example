class People {
  String? name;
  String? email;
  String? city;
  String? mac;
  String? timestamp;
  String? creditCard;
  String? id;

  People({
    this.name,
    this.email,
    this.city,
    this.mac,
    this.timestamp,
    this.creditCard,
    this.id,
  });

  factory People.fromJson(Map<String, dynamic> json) {
    return People(
      name: json["name"],
      email: json["email"],
      city: json["city"],
      mac: json["mac"],
      timestamp: json["timestamp"],
      creditCard: json["creditcard"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json["name"] = name;
    json["email"] = email;
    json["city"] = city;
    json["mac"] = mac;
    json["timestamp"] = timestamp;
    json["creditcard"] = creditCard;
    json["id"] = id;

    return json;
  }
}
