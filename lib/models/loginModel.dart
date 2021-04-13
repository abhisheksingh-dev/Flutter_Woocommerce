class LoginModel {
  bool success;
  int statusCode;
  String code;
  String message;
  Data data;

  LoginModel({
    this.code,
    this.data,
    this.message,
    this.statusCode,
    this.success,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    code = json['code'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    data['code'] = this.code;

    if (this.data != null) {
      data['data'] = this.data.toJson();
    }

    return data;
  }
}

class Data {
  String token;
  int id;
  String email;
  String niceName;
  String firstName;
  String lastName;
  String displayName;

  Data({
    this.displayName,
    this.email,
    this.firstName,
    this.id,
    this.lastName,
    this.niceName,
    this.token,
  });

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    niceName = json['niceName'];
    lastName = json['lastName'];
    id = json['id'];
    firstName = json['firstName'];
    email = json['email'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['firstName'] = this.firstName;
    data['id'] = this.id;
    data['lastName'] = this.lastName;
    data['niceName'] = this.niceName;

    return data;
  }
}
