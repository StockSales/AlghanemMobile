part of 'authentication_bloc.dart';

enum LoginStatus { init ,loading ,success, failure }
enum RegisterStatus { init ,loading , success, failure }

class AuthenticationState extends Equatable {
final LoginStatus loginStatus;
final RegisterStatus registerStatus;
final String? errorMessage;
final LoginModel ? loginModel;
final RegisterModel ? registerModel;


  @override
  String toString() {
    return 'AuthenticationState(loginStatus: $loginStatus, registerStatus: $registerStatus, errorMessage: $errorMessage, loginModel: $loginModel, registerModel: $registerModel)';
  }


  const AuthenticationState({
    this.loginStatus = LoginStatus.init,
    this.registerStatus = RegisterStatus.init,
    this.errorMessage,
    this.loginModel,
    this.registerModel,
  });
  AuthenticationState copyWith({
    LoginStatus? loginStatus,
    RegisterStatus? registerStatus,
    String? errorMessage,
    LoginModel? loginModel,
    RegisterModel? registerModel,
  }) {
    return AuthenticationState(
      loginStatus: loginStatus ?? this.loginStatus,
      registerStatus: registerStatus ?? this.registerStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      loginModel: loginModel ?? this.loginModel,
      registerModel: registerModel ?? this.registerModel,
    );
  }
  

  @override
  List<Object> get props => [];
}
