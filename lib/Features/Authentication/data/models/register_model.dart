import '../../../../core/utils/api/api_keys.dart';

class RegisterModel {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  RegisterModel(
      {required this.userName,
      required this.email,
      required this.password,
      required this.confirmPassword,});

  factory RegisterModel.fromJson(Map<String, dynamic> jsonData) {
    return RegisterModel(
      userName: jsonData[ApiKey.userName],
      email: jsonData[ApiKey.email],
      password: jsonData[ApiKey.password],
      confirmPassword: jsonData[ApiKey.confirmPassword],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.userName: userName,
      ApiKey.email: email,
      ApiKey.password: password,
      ApiKey.confirmPassword: confirmPassword,
    };
  }
}