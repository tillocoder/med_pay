class CustommerLoginResponse {
  CustommerLoginResponse({
    this.message,
  });

  CustommerLoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
}
