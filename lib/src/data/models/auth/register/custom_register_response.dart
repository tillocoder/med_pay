class ConfirmRegisterResponse {

  ConfirmRegisterResponse({this.name, this.phone});

  ConfirmRegisterResponse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
  }
  String? name;
  String? phone;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    return data;
  }
}
