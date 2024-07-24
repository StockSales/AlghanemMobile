import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/data/models/login_model.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/data/models/register_model.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/data/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository authRepository;
  AuthenticationBloc({required this.authRepository})
      : super(const AuthenticationState().copyWith(registerStatus: RegisterStatus.init, loginStatus: LoginStatus.init)) {
    on<AuthenticationEvent>((event, emit) {});

    on<LoginEvent>((event, emit) {
      log(event.loginModel.toString());
      emit(state.copyWith(loginStatus: LoginStatus.loading));
      authRepository.login(event.loginModel).then((value) {
        emit(state.copyWith(loginStatus: LoginStatus.success, loginModel: event.loginModel));
      }).catchError((error) {
        emit(state.copyWith(loginStatus: LoginStatus.failure, errorMessage: error.toString()));
      });
    });

    on<RegisterEvent>((event, emit) {
      emit(state.copyWith(registerStatus: RegisterStatus.loading));
      authRepository.register(event.registerModel).then((value) {
        emit(state.copyWith(registerStatus: RegisterStatus.success, registerModel: event.registerModel));
      }).catchError((error) {
        emit(state.copyWith(registerStatus: RegisterStatus.failure, errorMessage: error.toString()));
      });
    });
  }
}
