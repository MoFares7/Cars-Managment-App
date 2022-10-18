import 'package:flutter/material.dart';
import 'package:my_products/data/authService.dart';
import 'package:my_products/data/user.dart';
import 'package:my_products/ui/screen/homescreen/homescreen.dart';

import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  static const String routeName = 'Wrapper_Screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => Wrapper(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? CircularProgressIndicator() : HomeScreen();
        } else {
          return Scaffold(body: Text('The Email or Password is Unvalid'));
        }
      },
    );
  }
}
