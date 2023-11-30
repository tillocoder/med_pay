class CustomerPhoneResponse {
  CustomerPhoneResponse({
    this.phone,
  });

  CustomerPhoneResponse.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
  }

  String? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    return map;
  }
}
