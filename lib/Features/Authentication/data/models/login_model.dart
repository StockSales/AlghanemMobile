import 'package:el_ghanem_dot_net/Features/Authentication/data/datasources/remote_datasource.dart';

import '../../../../core/utils/api/api_keys.dart';
import 'auth_model.dart';

class LoginModel  {
  final String password;
  final String userName;
  LoginModel({required this.userName, required this.password,});

  factory LoginModel.fromJson(Map<String, dynamic> jsonData) {
    return LoginModel(
      userName: jsonData[ApiKey.userName],
      password: jsonData[ApiKey.password],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.userName: userName,
      ApiKey.password: password,
    };
  }
  @override
  String toString() {
    return 'LoginModel{userName: $userName, password: $password}';
  }
}
