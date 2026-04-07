class LoginModel {
  final String token;
  final String status;
  final String message;

  LoginModel({required this.token, required this.status, required this.message});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    // إذا الـ message = "Login successful." اعتبره نجاح
    String status = (json['message'] ?? '').toLowerCase() == 'login successful.'
        ? 'success'
        : 'failure';

    return LoginModel(
      token: json['token'] ?? "",
      status: status,
      message: json['message'] ?? "",
    );
  }
}