import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_products/constant/color.dart';
import 'package:my_products/constant/size.dart';
import 'package:my_products/ui/screen/loginscreen/loginscreen.dart';
import 'package:my_products/ui/screen/start/startscreen.dart';
import 'package:my_products/ui/widget/mainbutton.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'welcome_screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const WelcomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        
          SizedBox(
            height: kDefaultVerticalPadding * 6,
            //width: kDefaultHorizontalPadding * 3,
          ),
          Container(
            height: 360.0,
            width: double.infinity,
            child: SvgPicture.asset('assets/images/welcome.svg'),
          ),
          SizedBox(
            height: kDefaultVerticalPadding * 6,
            //width: kDefaultHorizontalPadding * 3,
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding * 7),
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, StartScreen.routeName);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(185),
              ),
              color: kOxfordBlueColor,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: kDefaultVerticalPadding,
                ),
                child: Text(
                  ">",
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: Colors.white, fontSize: 22.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
