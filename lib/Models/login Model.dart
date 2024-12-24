class ShopLoginModel
{
  bool? status;
  String? message;
  userData? data;
  ShopLoginModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? userData.fromJson( json['data']) : null;
  }
}

class userData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;
  int? credit;
  int? points;

  /*userData({
    this.name, this.id, this.email,
    this.image, this.phone, this.credit,
    this.token, this.points,
  });*/

  userData.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
    credit = json['credit'];
    points = json['points'];
  }
}

