// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_products/constant/color.dart';
import 'package:my_products/constant/size.dart';

import 'package:my_products/model/languge.dart';

import 'package:my_products/ui/screen/detaielsScreen/Ditaielsscreen.dart';
import 'package:my_products/ui/screen/drawerscreen/drawer.dart';

import 'package:my_products/ui/widget/mainappar.dart';

import 'package:my_products/ui/widget/productcard.dart';
import 'package:provider/provider.dart';

import '../../../model/productpicture.dart';
import '../../../model/provider.dart';
import '../addscreen/addproducts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = 'Home_screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeScreen(),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final _searchController = TextEditingController();
ProviderAddTask providerAddTask = ProviderAddTask();
List<Products> pro = product1;

AlertDialog alertDial() {
  return AlertDialog(
    title: const Text('Worning'),
    content: const Text(' are you sure ?'),
    actions: [
      // ignore: deprecated_member_use
      TextButton(onPressed: () {}, child: const Text('No')),
      TextButton(onPressed: () {}, child: const Text('Yes')),
    ],
  );
}

//Products products = Products();

class _HomeScreenState extends State<HomeScreen> {
// This list holds the data for the list view

  void showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(color: kRichBlackColor),
          Container(
            margin: EdgeInsets.only(left: kDefaultHorizontalPadding * 0.5),
            child: Text(
              'Logging out...',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      searchProduct;
      //   MainGridViwe();
    });
  }

  @override
  Widget build(BuildContext context) {
    Languge _languge = Languge();
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
        drawer: const DrawerScreen(),
        body: Stack(
          children: <Widget>[
            Container(
                height: 170,
                width: double.infinity,
                decoration: const BoxDecoration(color: kOxfordBlueColor),
                child: Column(
                  children: [
                    MainAppBar(
                      title: '',
                      leading: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, DrawerScreen.routeName);
                          },
                          icon: const Icon(Icons.list)),
                      actions: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AddProductScreen.routeName);
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 24,
                            )),
                      ],
                      color: kOxfordBlueColor,
                    ),
                    Text(
                      _languge.tHeader(),
                      style: GoogleFonts.redHatMono(
                        textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(top: kDefaultVerticalPadding * 5.5),
                child: Container(
                  height: 880,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      //   color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(55),
                          topLeft: Radius.circular(55))),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 190, horizontal: 51),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Required';
                  }
                  MultiValidator([
                    //RequiredValidator(errorText: 'Required'),
                    MaxLengthValidator(17, errorText: 'The Max Length is 17'),
                    MinLengthValidator(1, errorText: 'The Min Length is 1'),
                  ]);
                  return null;
                },
                controller: _searchController,
                onChanged: (value) {
                  searchProduct(value);
                },
                keyboardType: TextInputType.name,
                autofillHints: const [AutofillHints.name],
                decoration: InputDecoration(
                    filled: true,
                    fillColor: kPlatinumColor,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: kDefaultHorizontalPadding,
                        right: kDefaultHorizontalPadding * 0.75,
                      ),
                      child: Icon(
                        Icons.search,
                        size: 22,
                        color: kOxfordBlueColor.withOpacity(0.6),
                      ),
                    ),
                    hintText: _languge.tSearch(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide.none,
                    )),
              ),
            ),
            _searchController.text.isNotEmpty && product1.isEmpty
                ? Padding(
                    padding: EdgeInsets.only(
                        left: kDefaultLeftPadding / 2,
                        // bottom: kDefaultVerticalPadding*3,
                        top: ScreenUtil().setHeight(230),
                        right: kDefaultRightPadding / 2),
                    child: Center(
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.71,
                            crossAxisSpacing: kDefaultVerticalPadding * 0.3,
                          ),
                          itemCount: 1,
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: Container(
                                width: double.infinity,
                                height: 350,
                                child: SvgPicture.asset(
                                  'assets/images/notfound.svg',
                                ),
                              ),
                            );
                          }),
                    ))
                : Padding(
                    padding: EdgeInsets.only(
                        left: kDefaultLeftPadding / 2,
                        // bottom: kDefaultVerticalPadding*3,
                        top: ScreenUtil().setHeight(230),
                        right: kDefaultRightPadding / 2),
                    child: Consumer<ProviderAddTask>(
                        builder: (context, providerAddTask, child) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.71,
                          crossAxisSpacing: kDefaultVerticalPadding * 0.3,
                        ),
                        itemCount: providerAddTask.product1.length,
                        itemBuilder: (BuildContext context, int index) {
                          // final productsearch = product[index];

                          return ProductCard(
                            itemIndex: index,
                            products: providerAddTask.product1[index],
                            listTileDelete: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) => AlertDialog(
                                  elevation: 24,
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        providerAddTask.deleteTask(
                                            providerAddTask.product1[index]);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        _languge.tYes(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
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
                                    _languge.tWarningDelete(),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              );
                            },
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                          products:
                                              providerAddTask.product1[index],
                                        )),
                              );
                            },
                          );
                        },
                      );
                    })),
          ],
        ));
  }

  void searchProduct(String query) {
    final su = pro.where((productsearch) {
      final productTitle = productsearch.name.toLowerCase();
      final input = query.toLowerCase();

      return productTitle.contains(input);
    }).toList();

    setState(() {
      product1 = su;
    });
  }
}
