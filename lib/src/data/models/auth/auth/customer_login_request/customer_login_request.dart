class CustomerLoginRequest {

  CustomerLoginRequest({this.phone});

  CustomerLoginRequest.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
  }
  String? phone;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    return data;
  }
}

