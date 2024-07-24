part of 'authentication_bloc.dart';

class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthenticationEvent {
final LoginModel loginModel;
  const LoginEvent({required this.loginModel});
}

class RegisterEvent extends AuthenticationEvent {
final RegisterModel registerModel;
  const RegisterEvent({required this.registerModel});
}
