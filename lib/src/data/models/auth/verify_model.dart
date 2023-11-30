class VerifyRegister {
  const VerifyRegister({
    required this.phone,
    required this.userName,
  });

  final String phone;
  final String userName;
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['userName']=userName;
    return data;
  }
}