class Profile {
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
  String? longitude;
  String? latitude;
  String? role;

  Profile(
      {this.firstName,
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
      this.longitude,
      this.latitude,
      this.role});

  factory Profile.fromJson(Map<String, dynamic> res) {
    return Profile(
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
      longitude: res['longitude'],
      latitude: res['latitude'],
      role: res['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone_number": phoneNumber,
      "username": username,
      "password": password,
      "avatar": avatar,
      "thumb": thumb,
      "province": province,
      "district": district,
      "ward": ward,
      "street": street,
      "longitude": longitude,
      "latitude": latitude,
      "role": role,
    };
  }
}
