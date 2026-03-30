class LoginModel {
  final String token;
  final String status;
  final String message;

  LoginModel({required this.token, required this.status, required this.message});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json['token'] ?? "",
      status: json['status'] ?? "error",
      message: json['message'] ?? "",
    );
  }
}