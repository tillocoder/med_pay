class ConfirmLoginResponse {

  ConfirmLoginResponse(
      {this.id,
        this.name,
        this.phone,
        this.isBlocked,
        this.createdAt,
        this.updatedAt,
        this.accessToken,
        this.refreshToken,
        this.minimalOrderPrice});

  ConfirmLoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    isBlocked = json['is_blocked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    minimalOrderPrice = json['minimal_order_price'];
  }
  String? id;
  String? name;
  String? phone;
  bool? isBlocked;
  String? createdAt;
  String? updatedAt;
  String? accessToken;
  String? refreshToken;
  int? minimalOrderPrice;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['is_blocked'] = isBlocked;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    data['minimal_order_price'] = minimalOrderPrice;
    return data;
  }
}