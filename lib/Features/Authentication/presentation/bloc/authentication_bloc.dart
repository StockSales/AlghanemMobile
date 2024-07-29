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
  AuthenticationBloc({required this.authRepository}) : super(const AuthenticationState()) {
    on<AuthenticationEvent>((event, emit) {});

    on<LoginEvent>((event, emit) async {
      log(event.loginModel.toString());
      emit(state.copyWith(loginStatus: LoginStatus.loading));
      try {
        (await authRepository.login(event.loginModel)).fold((l) {
          emit(state.copyWith(loginStatus: LoginStatus.failure, errorMessage: l.toString()));
        }, (r) {
          emit(state.copyWith(loginStatus: LoginStatus.success, loginModel: event.loginModel));
          state.toString();
        });
      } catch (error) {
        emit(state.copyWith(loginStatus: LoginStatus.failure, errorMessage: error.toString()));
      }
    });
//Omar@123
    on<RegisterEvent>((event, emit) async {
      emit(state.copyWith(registerStatus: RegisterStatus.loading));
      (await authRepository.register(event.registerModel)).fold(
        (l) => emit(state.copyWith(registerStatus: RegisterStatus.failure, errorMessage: l.toString())),
        (r) => emit(state.copyWith(registerStatus: RegisterStatus.success, registerModel: event.registerModel)),
      );
    });
  }
}
