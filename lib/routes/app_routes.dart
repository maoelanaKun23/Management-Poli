import 'package:flutter/material.dart';
import '../views/poli_page.dart';
// import '../views/login.dart';
// import '../views/mainhome.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/';
  // static const String mainhome = '/mainhome';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => Polipage());
      // case login:
      //   return MaterialPageRoute(builder: (_) => Login());
      // case mainhome:
      //   return MaterialPageRoute(builder: (_) => const NavigationExample()); 
      default:
        return MaterialPageRoute(builder: (_) => Polipage()); // Halaman default
    }
  }
}
