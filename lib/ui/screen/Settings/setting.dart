import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_products/constant/color.dart';
import 'package:my_products/constant/size.dart';
import 'package:my_products/main.dart';
import 'package:my_products/model/languge.dart';
import 'package:my_products/model/provider.dart';
import 'package:my_products/ui/screen/homescreen/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(SettingsScreen());

class SettingsScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static const String routeName = 'Settings_Screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => SettingsScreen(),
    );
  }
}

class _MyAppState extends State<SettingsScreen> {
  Languge _languge = Languge();
  List<String> _languags = ['AR', 'EN'];
  var _selectedLanguage;
  bool _darkMode = false;
  bool _notificattion = false;
  bool isDarkModeEnabled = false;

  @override
  void initState() {
    super.initState();

    getSelected();
  }

  /// Called when the state (day / night) has changed.
  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      this.isDarkModeEnabled = isDarkModeEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProviderData _providerData = Provider.of<ProviderData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_languge.tSetting()),
        backgroundColor: kOxfordBlueColor,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, HomeScreen.routeName);
            //  Navigator.of(context).popUntil(ModalRoute.withName("Home_screen"));
          },
          icon: Icon(Icons.arrow_back),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: [
              SizedBox(
                height: kDefaultVerticalPadding / 2,
              ),
              ListTile(
                title: Text(_languge.tLan(),
                    style: GoogleFonts.redHatMono(textStyle: TextStyle())),
                leading: Icon(
                  Icons.language,
                ),
                trailing: DropdownButton(
                  hint: Text('Languges'),
                  value: _selectedLanguage,
                  onChanged: (newValue) async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.setString('Languge', newValue.toString());
                    _languge.setLanguge(newValue.toString());
                    languge = newValue.toString();
                    setState(() {
                      _selectedLanguage = newValue;
                    });
                  },
                  items: _languags.map((lang) {
                    return DropdownMenuItem(
                      child: new Text(lang),
                      value: lang,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: kDefaultVerticalPadding / 2,
              ),
              ListTile(
                  title: Text(_languge.tDark(),
                      style: GoogleFonts.redHatMono(textStyle: TextStyle())),
                  leading: Icon(
                    Icons.brightness_2,
                  ),
                  trailing: Switch(
                    activeColor: kOxfordBlueColor,
                    onChanged: (val) async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.setBool('Dark Mode', val);

                      setState(() {
                        if (_darkMode) {
                          _providerData.setTheme(ThemeData.light());
                        } else {
                          _providerData.setTheme(ThemeData.dark());
                        }
                        _darkMode = val;
                      });
                    },
                    value: _darkMode,
                  )),
              SizedBox(
                height: kDefaultVerticalPadding / 2,
              ),
              ListTile(
                title: Text(_languge.tnotification(),
                    style: GoogleFonts.redHatMono(textStyle: TextStyle())),
                leading: Icon(
                  Icons.notification_important,
                ),
                trailing: Switch(
                  activeColor: kOxfordBlueColor,
                  onChanged: (val1) async {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.setBool('Noifications', val1);

                    setState(() {
                      _notificattion = val1;
                    });
                  },
                  value: _notificattion,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Functions

  getSelected() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      _selectedLanguage = preferences.getString('Languge');
      _darkMode = preferences.getBool('Dark Mode')!;
      _notificattion = preferences.getBool('Noifications')!;
    });
  }
}
