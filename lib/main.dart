import 'package:el_ghanem_dot_net/core/service_locator/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const HomeScreen());
}
