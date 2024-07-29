import 'package:el_ghanem_dot_net/core/service_locator/dependency_injection.dart';
import 'package:el_ghanem_dot_net/core/utils/bloc_observer/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
    Bloc.observer = MyBlocObserver();

  runApp(const HomeScreen());
}
// Ahmed
// ASDasd1234!@#$