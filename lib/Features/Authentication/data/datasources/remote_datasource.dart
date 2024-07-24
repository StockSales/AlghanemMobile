import 'package:el_ghanem_dot_net/Features/Authentication/data/models/login_model.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/data/models/register_model.dart';
import 'package:el_ghanem_dot_net/core/utils/api/dio_consumer.dart';

import '../../../../core/utils/api/api_keys.dart';
import '../../../../core/utils/api/end_ponits.dart';

abstract class RemoteDatasource {
  Future<dynamic> login(LoginModel loginModel);
  Future<dynamic> register(RegisterModel registerModel);
}

class RemoteDatasourceImpl extends RemoteDatasource {
  final DioConsumer dioConsumer;
  RemoteDatasourceImpl({required this.dioConsumer});

  @override
  Future<dynamic> login(LoginModel loginModel) async {
    final response = await dioConsumer.post(EndPoint.signIn, data: {
      ApiKey.userName: loginModel.userName,
      ApiKey.password: loginModel.password,
    });
    return response;
  }

  @override
  Future<dynamic> register(RegisterModel registerModel) async {
    final response = await dioConsumer.post(EndPoint.signUp, data: {
      ApiKey.userName: registerModel.userName,
      ApiKey.email: registerModel.email,
      ApiKey.password: registerModel.password,
      ApiKey.confirmPassword: registerModel.confirmPassword,
    });
    return response;
  }
}
