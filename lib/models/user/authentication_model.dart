class AuthenticationModel {
  AuthenticationModel({
    required this.username,
    required this.token,
  });
  final String username;
  final String token;

  factory AuthenticationModel.fromJson(Map<String, dynamic> authJSON) =>
      AuthenticationModel(
        username: authJSON["name"],
        token: authJSON["token"],
      );
}
