import 'package:dartz/dartz.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/data/datasources/remote_datasource.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/data/datasources/secure_storage.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/data/models/register_model.dart';

import '../models/login_model.dart';

abstract class AuthRepository {
  Future<Either<Exception, dynamic>> login(LoginModel loginModel);
  Future<Either<Exception, dynamic>> register(RegisterModel registerModel);
}

class AuthRepositoryImpl extends AuthRepository {
  final RemoteDatasource remoteDatasource;
  AuthRepositoryImpl({required this.remoteDatasource});

  @override
  Future<Either<Exception, dynamic>> login(LoginModel loginModel) async {
    try {
      final response = await remoteDatasource.login(loginModel);
        // saving token in the flutter_secureStorage
         SecureStorage.instance.saveToken(response['data']['token']);
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }

  }

  @override
  Future<Either<Exception, dynamic>> register(RegisterModel registerModel) async {
    try {
      final response = await remoteDatasource.register(registerModel);
      return Right(response);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
