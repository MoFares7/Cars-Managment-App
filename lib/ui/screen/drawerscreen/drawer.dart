import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_products/constant/color.dart';
import 'package:my_products/constant/size.dart';

import 'package:my_products/model/languge.dart';
import 'package:my_products/ui/screen/Settings/setting.dart';

import 'package:my_products/ui/screen/homescreen/homescreen.dart';
import 'package:my_products/ui/screen/welcome/welcomescreen.dart';

import 'package:my_products/ui/widget/menu_item.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  static const String routeName = 'Drawer_Screen_Screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => DrawerScreen(),
    );
  }

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  Languge _languge = Languge();

  final _auth = FirebaseAuth.instance;
  late User signedInUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(
      () => _languge.getLanguge(),
    );
  }

  void showLogOutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        elevation: 24,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => WelcomeScreen()));
              _auth.signOut();

              //   Navigator.popUntil(context, (route) => false);
            },
            child: Text(
              _languge.tYes(),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: kRichBlackColor,
                  ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              _languge.tNo(),
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: kRichBlackColor,
                  ),
            ),
          ),
        ],
        title: Text(
          _languge.tWarning(),
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        content: Text(
          _languge.tWarningDetails(),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: kOxfordBlueColor,
            width: double.infinity,
            height: kDefaultVerticalPadding * 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: kDefaultVerticalPadding),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/fares.jpg'),
                  radius: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: Text(
                    "Development by Mo Fares",
                    style: GoogleFonts.redHatMono(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Text(
                  "faresdabbas1@gmail.com",
                  style: GoogleFonts.redHatMono(
                    textStyle: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 9,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: kDefaultVerticalPadding,
                ),
                MenuItem(
                    icon: Icons.home,
                    title: _languge.tHome(),
                    press: () {
                      Navigator.pushNamed(context, HomeScreen.routeName);
                    }),
                Divider(),
                MenuItem(
                    icon: Icons.settings,
                    title: _languge.tSetting(),
                    press: () {
                      Navigator.pushNamed(context, SettingsScreen.routeName);
                    }),
                Divider(),
                MenuItem(
                    icon: Icons.logout,
                    title: _languge.tLogOut(),
                    press: () {
                      showLogOutDialog(context);

                      //Navigator.pushNamed(context, WelcomeScreen.routeName);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
