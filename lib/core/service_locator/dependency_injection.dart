import 'package:dio/dio.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/data/datasources/remote_datasource.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/data/repositories/auth_repository.dart';
import 'package:el_ghanem_dot_net/core/utils/api/dio_consumer.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
// Ahmed ASDasd1234!@#$
void setupLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: getIt<Dio>()));
  getIt.registerLazySingleton<RemoteDatasource>(() => RemoteDatasourceImpl(dioConsumer: getIt<DioConsumer>()));
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(remoteDatasource: getIt<RemoteDatasource>()));
}
