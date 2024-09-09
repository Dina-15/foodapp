class UserModel {
  late String name;
  late String phone;
  late String address;
  late String email;
  late String password;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      "email": email,
      'password': password
    };
  }
}
