import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_products/data/authService.dart';
import 'package:my_products/data/wallpaper.dart';

import 'package:my_products/model/provider.dart';
import 'package:my_products/ui/screen/homescreen/homescreen.dart';

import 'package:my_products/ui/screen/welcome/welcomescreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant/route_config.dart';

var languge = 'EA';
bool darkMode = false;
var view = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDs2ZM6PzOY5dVqzFScauJzmjkstjINHAU",
      appId: "1:26508874175:android:77e2e763c80e618f02910a",
      messagingSenderId: "26508874175",
      projectId: "26508874175",
    ),
  );
  SharedPreferences.getInstance().then((instance) {
    languge = instance.getString('Languge')!;
    darkMode = instance.getBool('darkMode')!;
    view = instance.getInt('0')!;
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthService>(
          create: (context) => AuthService(),
          child: const Wrapper(),
        ),
        ChangeNotifierProvider<ProviderAddTask>(
          create: (context) => ProviderAddTask(),
          child: const HomeScreen(),
        )
      ],
      child: ChangeNotifierProvider<ProviderData>(
        create: (context) => ProviderData(ThemeData.dark()),
        child: ScreenUtilInit(builder: () => const ProductsCars()),
      ),
    );
  }
}

class ProductsCars extends StatelessWidget {
  const ProductsCars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme1 = Provider.of<ProviderData>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Management',
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: SpinKitScreen(),
      theme: theme1.getTheme(),
    );
  }
}

class SpinKitScreen extends StatefulWidget {
  @override
  _SpinKitScreenState createState() => _SpinKitScreenState();
}

class _SpinKitScreenState extends State<SpinKitScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 30, 30, 30)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Products MO",
                style: GoogleFonts.redHatMono(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SpinKitWave(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven
                        ? Colors.white
                        : Color.fromARGB(255, 0, 0, 0),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    ));
  }
}
