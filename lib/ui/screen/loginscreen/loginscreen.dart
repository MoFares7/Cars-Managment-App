import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_products/constant/color.dart';
import 'package:my_products/constant/size.dart';
import 'package:my_products/data/authService.dart';
import 'package:my_products/data/wallpaper.dart';
import 'package:my_products/model/languge.dart';
import 'package:my_products/ui/screen/homescreen/homescreen.dart';
import 'package:my_products/ui/screen/signupscreen/signup.dart';
import 'package:my_products/ui/screen/welcome/welcomescreen.dart';
import 'package:my_products/ui/widget/mainbutton.dart';
import 'package:my_products/ui/widget/passwordfiled.dart';
import 'package:my_products/ui/widget/emai;filed.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import '../../../data/checkinternet.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String routeName = 'Login_screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => LoginScreen(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

void showCheckNetDialog(BuildContext context, String text) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      elevation: 24,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Ok',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: kRichBlackColor,
                ),
          ),
        ),
      ],
      title: Text(
        'Warning',
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontWeight: FontWeight.w700),
      ),
      content: Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    ),
  );
}

class _LoginScreenState extends State<LoginScreen> {
  // Note: This is a GlobalKey<ScaffoldState>,
  final formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final Languge _languge = Languge();

  @override
  // ignore: must_call_super
  void initState() {}

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
        body: Container(
      height: defaultScreenHeight,
      child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: kDefaultVerticalPadding * 3,
                  ),
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: SvgPicture.asset('assets/images/login.svg'),
                  ),
                  SizedBox(
                    height: kDefaultVerticalPadding * 2,
                    //size.width - 382,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      _languge.tEmail(),
                      style: GoogleFonts.redHatMono(
                          textStyle: TextStyle(
                        letterSpacing: 1,
                        fontSize: 19,
                      )),
                    ),
                  ),
                  SizedBox(height: kDefaultVerticalPadding),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultHorizontalPadding),
                          child: TextFormEmail(
                            icon: Icons.alternate_email,
                            hintText: _languge.tEmail(),
                            controller: _emailController,
                            validator: MultiValidator([
                              RequiredValidator(errorText: 'Required'),
                              EmailValidator(errorText: 'Enter Valid Email')
                            ]),
                          ),
                        ),
                        SizedBox(height: kDefaultVerticalPadding),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultHorizontalPadding),
                          child: Text(
                            _languge.tPassword(),
                            style: GoogleFonts.redHatMono(
                                textStyle: TextStyle(
                              letterSpacing: 1,
                              fontSize: 19,
                            )),
                          ),
                        ),
                        SizedBox(height: kDefaultVerticalPadding),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultHorizontalPadding),
                          child: PasswordUserFormFiled(
                              hintText: _languge.tPassword(),
                              controller: _passwordController,
                              icon: Icons.lock,
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Required'),
                                MaxLengthValidator(15,
                                    errorText: 'The Max Length is 15'),
                                MinLengthValidator(5,
                                    errorText: 'The Max Length is 5'),
                              ])),
                        ),
                        SizedBox(
                          height: kDefaultVerticalPadding * 2,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultHorizontalPadding * 5,
                              vertical: kDefaultVerticalPadding - 20),
                          child: MainButton(
                              backgroundColor: kOxfordBlueColor,
                              textColor: Colors.white,
                              label: _languge.tLogin(),
                              onPressed: () async {
                                _checkInternet();
                                if (formKey.currentState!.validate()) {
                                  await authService
                                      .signUserWithEmailAndPaswword(
                                          _emailController.text,
                                          _passwordController.text);

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              Wrapper()));
                                }
                              }),
                        ),
                        SizedBox(
                          height: kDefaultVerticalPadding,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              // vertical: kDefaultVerticalPadding - 20,
                              horizontal: kDefaultHorizontalPadding),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Our Sign Up With',
                                style: GoogleFonts.redHatMono(
                                    textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                )),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, SignUpScreen.routeName);
                                  },
                                  child: Text('Sign Up',
                                      style: GoogleFonts.redHatMono(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                      ))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )),
    ));
  }

  _checkInternet() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      showCheckNetDialog(context, 'You are not Connect with internet 😁');
    }
  }
}
