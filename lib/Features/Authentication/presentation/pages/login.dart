import 'dart:developer';
import 'package:el_ghanem_dot_net/Features/Authentication/data/models/login_model.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/presentation/bloc/authentication_bloc.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/presentation/pages/register.dart';
import 'package:el_ghanem_dot_net/core/extensions/extensions.dart';
import 'package:el_ghanem_dot_net/core/extensions/text_theme_extensions.dart';
import 'package:el_ghanem_dot_net/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                  alignment: Alignment.center,
                  height: size.height * 0.4,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)), color: AppColors.primaryColor),
                  child: Text('الغانم', style: context.displaySmall)),
            ),
            const Gap(20),
            // AuthFormField(
            //     type: TextInputType.emailAddress,
            //     controller: emailController,
            //     onChange: (value) {
            //       emailController.text = value;
            //       final emailData = value;
            //       log(emailData, name: "email address");
            //     },
            //     validate: (value) {
            //       if (value == null || value.isEmpty) {
            //         return 'Please enter your email';
            //       }
            //       return null;
            //     },
            //     text: 'Email'),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                        labelText: 'أسم المستخدم',
                      ),
                      onSaved: (newValue) {
                        BlocProvider.of<AuthenticationBloc>(context).add(
                          LoginEvent(loginModel: LoginModel(userName: userNameController.text, password: passwordController.text)),
                        );
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'برجاء ادخال اسم المستخدم';
                        }

                        return null;
                      },
                    ),
                    const Gap(40),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'كلمة المرور',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'برجاء ادخال كلمة المرور';
                        }
                        return null;
                      },
                    ),
                    const Gap(40),
                    BlocListener<AuthenticationBloc, AuthenticationState>(
                      listener: (context, state) {
                        if (state.loginStatus == LoginStatus.success) {
                          log(state.loginModel!.userName, name: "login success");
                          context.navigateTo(const HomeView());
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${state.loginModel!.userName} تم تسجيل الدخول بنجاح"),
                            ),
                          );
                        }

                        if (state.loginStatus == LoginStatus.failure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.errorMessage!),
                            ),
                          );
                        }
                      },
                      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          if (state.loginStatus == LoginStatus.loading) {
                            return const CircularProgressIndicator();
                          }
                          return ElevatedButton(
                            onPressed: () {
                              // BlocProvider.of<AuthenticationBloc>(context).add(
                              //   LoginEvent(loginModel: LoginModel(userName: userNameController.text, password: passwordController.text)),
                              // );
                              if (_formKey.currentState!.validate()) {
                                // Perform login logic here
                                BlocProvider.of<AuthenticationBloc>(context).add(
                                  LoginEvent(loginModel: LoginModel(userName: userNameController.text, password: passwordController.text)),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50), // Set your desired radius here
                              ),
                            ),
                            child: Text(
                              'تسجيل الدخول',
                              style: context.titleMedium,
                            ),
                          );
                        },
                      ),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Gap(10),
                        const Text('ليس لديك حساب؟'),
                        TextButton(
                          onPressed: () {
                            context.navigateTo(const RegistrationForm());
                          },
                          child: const Text('انشاء حساب'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
