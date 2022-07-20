class User {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? username;
  String? password;
  String? avatar;
  String? thumb;
  String? province;
  String? district;
  String? ward;
  String? street;
  String? role;
  String? longitude;
  String? latitude;
  bool? status;
  String? createAt;
  String? updateAt;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.username,
    this.password,
    this.avatar,
    this.thumb,
    this.province,
    this.district,
    this.ward,
    this.street,
    this.role,
    this.longitude,
    this.latitude,
    this.status,
    this.createAt,
    this.updateAt,
  });

  factory User.fromJson(Map<String, dynamic> res) {
    return User(
      id: res['_id'],
      firstName: res['first_name'],
      lastName: res['last_name'],
      email: res['email'],
      phoneNumber: res['phone_number'],
      username: res['username'],
      password: res['password'],
      avatar: res['avatar'],
      thumb: res['thumb'],
      province: res['province'],
      district: res['district'],
      ward: res['ward'],
      street: res['street'],
      role: res['role'],
      longitude: res['longitude'],
      latitude: res['latitude'],
      status: res['status'],
      createAt: res['createAt'],
      updateAt: res['updateAt'],
    );
  }
}
