import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/presentation/bloc/authentication_bloc.dart';
import 'package:el_ghanem_dot_net/Features/Authentication/presentation/pages/login.dart';
import 'package:el_ghanem_dot_net/core/service_locator/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/constants/app_colors/app_colors.dart';
import 'core/constants/app_strings/home_screen_strings.dart';
import 'core/theme/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthenticationBloc(authRepository: getIt())),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 69),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              locale: const Locale('ar'),
              supportedLocales: const [
                Locale('en'), // English
                Locale('ar'), // Arabic
              ],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              home: const LoginScreen(),
            );
          }),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(HomeScreenStrings.homeScreenTitle)),
      body: const Center(
        child: Text(HomeScreenStrings.homeScreenSubtitle),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: AppColors.primaryColor,
        buttonBackgroundColor: AppColors.primaryColor,
        backgroundColor: AppColors.whiteColor,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        items: const <Widget>[
          Icon(
            Icons.home_outlined,
          ),
          Icon(
            Icons.discount_outlined,
          ),
          Icon(
            Icons.shopping_cart_outlined,
          ),
          Icon(
            Icons.menu,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.search),
      ),
    );
  }
}
