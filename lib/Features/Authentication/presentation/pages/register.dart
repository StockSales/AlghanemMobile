import 'package:el_ghanem_dot_net/Features/Authentication/data/models/register_model.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/presentation/bloc/authentication_bloc.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/presentation/pages/login.dart';
import 'package:el_ghanem_dot_net/core/constants/app_strings/register_strings.dart';
import 'package:el_ghanem_dot_net/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterView();
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Perform registration logic
      print('النموذج صالح');
    } else {
      print('النموذج غير صالح');
    }
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return RegisterStrings.passwordHint;
    }
    if (value.length < 6) {
      return RegisterStrings.passwordShort;
    }
    if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\W)').hasMatch(value)) {
      return RegisterStrings.passwordInvalid;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(RegisterStrings.registerTitle),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(labelText: RegisterStrings.emailLabel),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return RegisterStrings.emailHint;
                              }
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                                return RegisterStrings.emailInvalid;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _usernameController,
                            decoration: const InputDecoration(labelText: RegisterStrings.usernameLabel),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return RegisterStrings.usernameHint;
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(labelText: RegisterStrings.passwordLabel),
                            obscureText: true,
                            validator: _validatePassword,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _confirmPasswordController,
                            decoration: const InputDecoration(labelText: RegisterStrings.confirmPasswordLabel),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return RegisterStrings.confirmPasswordHint;
                              }
                              if (value != _passwordController.text) {
                                return RegisterStrings.passwordMismatch;
                              }
                              return null;
                            },
                          ),
                          const Spacer(),
                          BlocConsumer<AuthenticationBloc, AuthenticationState>(
                            builder: (context, state) {
                              if (state.registerStatus == RegisterStatus.loading) {
                                return const Center(child: CircularProgressIndicator());
                              }
                              return ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<AuthenticationBloc>(context).add(
                                    RegisterEvent(
                                        registerModel: RegisterModel(
                                            email: _emailController.text,
                                            userName: _usernameController.text,
                                            password: _passwordController.text,
                                            confirmPassword: _confirmPasswordController.text)),
                                  );
                                },
                                child: const Text(RegisterStrings.registerButton),
                              );
                            },
                            listener: (BuildContext context, AuthenticationState state) {
                              context.navigateTo(const LoginScreen());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
