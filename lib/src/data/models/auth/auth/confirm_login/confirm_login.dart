class ConfirmLoginRequest {

  ConfirmLoginRequest({this.code, this.phone});

  ConfirmLoginRequest.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    phone = json['phone'];
  }
  String? code;
  String? phone;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['phone'] = phone;
    return data;
  }
}
