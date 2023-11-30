class VerifyRequest {
  const VerifyRequest({
    required this.phone,
  });

  final String phone;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    return data;
  }
}
