import 'package:el_ghanem_dot_net/core/constants/app_keys/keys_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._privateConstructor();

  // Create a static instance of the class
  static final SecureStorage _instance = SecureStorage._privateConstructor();

  // Provide a public method to get the instance of the class
  static SecureStorage get instance => _instance;
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  saveToken(String? token) async {
    try {
      await storage.write(key: AppKeys.authToken, value: token);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<String?> getToken() async {
    return await storage.read(key: AppKeys.authToken);
  }

  deleteToken() async {
    await storage.delete(key: AppKeys.authToken);
  }
}
