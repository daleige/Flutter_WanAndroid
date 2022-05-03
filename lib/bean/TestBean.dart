class TestBean {
  String? name;
  String? email;
  int? age;
  Address? address;

  TestBean({this.name, this.email, this.age, this.address});

  TestBean.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    age = json['age'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['age'] = this.age;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}

class Address {
  String? code;
  String? content;

  Address({this.code, this.content});

  Address.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['content'] = this.content;
    return data;
  }
}

