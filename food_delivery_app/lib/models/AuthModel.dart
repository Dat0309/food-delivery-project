class AuthModel {
  String? id;
  String? email;
  String? role;
  String? token;
  String? createAt;

  AuthModel({
    required this.id,
    required this.email,
    required this.role,
    required this.token,
    required this.createAt,
  });

  factory AuthModel.fromJson(Map<String, dynamic> res) {
    return AuthModel(
      id: res['_id'],
      email: res['email'],
      role: res['role'],
      token: res['token'],
      createAt: res['createdAt'],
    );
  }
}
