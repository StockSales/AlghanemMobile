class EndPoint {
  static const String baseUrl = 'http://192.168.1.36:5285/';
  static String signIn = "user/signin";
  static String signUp = "user/signup";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}
