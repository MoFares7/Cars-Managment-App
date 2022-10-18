import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_products/constant/size.dart';

import 'package:my_products/model/languge.dart';
import 'package:my_products/ui/screen/homescreen/homescreen.dart';
import 'package:my_products/ui/screen/loginscreen/loginscreen.dart';
import 'package:my_products/ui/widget/costumtextfiled.dart';

import 'package:my_products/ui/widget/emai;filed.dart';
import 'package:my_products/ui/widget/mainbutton.dart';
import 'package:my_products/ui/widget/passwordfiled.dart';
import 'package:provider/provider.dart';

import '../../../constant/color.dart';
import '../../../data/authService.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  static const String routeName = 'Signup_screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => SignUpScreen(),
    );
  }

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();


  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

 
  bool isLoader = false;

  Languge _languge = Languge();

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
              Container(
                height: 200,
                width: double.infinity,
                child: SvgPicture.asset('assets/images/signup.svg'),
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: Text(
                        _languge.tUserName(),
                        style: GoogleFonts.redHatMono(
                            textStyle: TextStyle(
                          letterSpacing: 1,
                          fontSize: 19,
                        )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultHorizontalPadding),
                      child: UserNameFormCustomer(
                          onChanged: () {},
                          icon: Icons.person,
                          hintText: _languge.tUserName(),
                          validator: MultiValidator([
                            //RequiredValidator(errorText: 'Required'),
                            MaxLengthValidator(9,
                                errorText: 'The Max Length is 9'),
                            MinLengthValidator(3,
                                errorText: 'The Min Length is 3'),
                          ])),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      child: Text(
                        _languge.tEmail(),
                        style: GoogleFonts.redHatMono(
                            textStyle: TextStyle(
                          letterSpacing: 1,
                          fontSize: 19,
                        )),
                      ),
                    ),
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
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      child: Text(
                        _languge.tPassword(),
                        style: GoogleFonts.redHatMono(
                            textStyle: TextStyle(
                          letterSpacing: 1,
                          fontSize: 19,
                        )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultHorizontalPadding),
                      child: PasswordUserFormFiled(
                          hintText: _languge.tPassword(),
                          controller: _passwordController,
                          icon: Icons.lock,
                          validator: MultiValidator([
                            RequiredValidator(errorText: 'Required'),
                            MaxLengthValidator(12,
                                errorText: 'The Max Length is 12'),
                            MinLengthValidator(5,
                                errorText: 'The Max Length is 5'),
                          ])),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultHorizontalPadding * 5,
                          vertical: kDefaultVerticalPadding),
                      child: MainButton(
                          backgroundColor: kOxfordBlueColor,
                          textColor: Colors.white,
                          label: _languge.tSignUp(),
                          onPressed: () async {
                            _checkInternet();
                            if (formKey.currentState!.validate()) {
                              await authService.createUserWithEmailAndPaswword(
                                  _emailController.text,
                                  _passwordController.text);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomeScreen()));
                            }
                          }),
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
                            'Our Login With',
                            style: GoogleFonts.redHatMono(
                                textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, LoginScreen.routeName);
                              },
                              child: Text(
                                'Login ',
                                style: GoogleFonts.redHatMono(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold)),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _checkInternet() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      showCheckNetDialog(context, 'You are not Connect with internet 😁');
    }
  }
}
