import 'package:flutter/material.dart';
import 'package:my_products/data/wallpaper.dart';
import 'package:my_products/model/products.dart';
import 'package:my_products/ui/screen/Settings/setting.dart';

import 'package:my_products/ui/screen/drawerscreen/drawer.dart';
import 'package:my_products/ui/screen/homescreen/homescreen.dart';
import 'package:my_products/ui/screen/loginscreen/loginscreen.dart';
import 'package:my_products/ui/screen/signupscreen/signup.dart';
import 'package:my_products/ui/screen/start/startscreen.dart';

import '../model/productpicture.dart';

import '../ui/screen/addscreen/addproducts.dart';
import '../ui/screen/welcome/welcomescreen.dart';

late Products p;

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WelcomeScreen.routeName:
        return WelcomeScreen.route();
      case StartScreen.routeName:
        return StartScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();

      case SignUpScreen.routeName:
        return SignUpScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case AddProductScreen.routeName:
        return AddProductScreen.route();
      case SettingsScreen.routeName:
        return SettingsScreen.route();
      case Wrapper.routeName:
        return Wrapper.route();

      case DrawerScreen.routeName:
        return DrawerScreen.route();
      default:
        return error();
    }
  }
}

Route error() {
  return MaterialPageRoute(
    builder: (context) => Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
        backgroundColor: Colors.black,
      ),
    ),
  );
}
