import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_products/constant/color.dart';
import 'package:my_products/constant/size.dart';
import 'package:my_products/data/wallpaper.dart';
import 'package:my_products/model/languge.dart';
import 'package:my_products/ui/screen/loginscreen/loginscreen.dart';
import 'package:my_products/ui/screen/signupscreen/signup.dart';
import 'package:my_products/ui/widget/mainbutton.dart';

class StartScreen extends StatelessWidget {
  StartScreen({Key? key}) : super(key: key);

  static const String routeName = 'Start_screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => StartScreen(),
    );
  }

  Languge _languge = Languge();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: kDefaultVerticalPadding * 5,
          ),
          Container(
            height: 240.0,
            width: double.infinity,
            child: SvgPicture.asset('assets/images/start.svg'),
          ),
          SizedBox(
            height: kDefaultVerticalPadding * 4,
          ),
          Center(
            child: Text(
              _languge.tStartWelcome(),
              style: GoogleFonts.redHatMono(
                  textStyle: TextStyle(
                      letterSpacing: 1,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          SizedBox(
            height: kDefaultVerticalPadding * 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: MainButton(
              backgroundColor: kOxfordBlueColor,
              label: _languge.tLogin(),
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
            ),
          ),
          SizedBox(
            height: kDefaultVerticalPadding * 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 120),
            child: MainButton(
                backgroundColor: kOxfordBlueColor,
                textColor: Colors.white,
                label: _languge.tSignUp(),
                onPressed: () {
                  Navigator.pushNamed(context, SignUpScreen.routeName);
                }),
          ),
        ],
      ),
    );
  }
}
