import 'package:el_ghanem_dot_net/Features/Authentication/data/datasources/remote_datasource.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/data/models/register_model.dart';

import '../models/login_model.dart';

abstract class AuthRepository {
  Future<dynamic> login(LoginModel loginModel);
  Future<dynamic> register(RegisterModel registerModel);
}

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDatasource remoteDatasource;
  AuthRepositoryImpl({required this.remoteDatasource});

  @override
  Future<dynamic> login(LoginModel loginModel) async {
    try {
      final response = await remoteDatasource.login(loginModel);
      return response;
    } on Exception catch (e) {
      return e;
    }
  }

  @override
  Future<dynamic> register(RegisterModel registerModel) async {
    try {
      final response = await remoteDatasource.register(registerModel);
      return response;
    } on Exception catch (e) {
      return e;
    }
  }
}
