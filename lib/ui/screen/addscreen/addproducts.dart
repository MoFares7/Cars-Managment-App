// ignore_for_file: deprecated_member_use

import 'dart:io';


import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:my_products/constant/color.dart';
import 'package:my_products/constant/size.dart';
import 'package:my_products/model/languge.dart';
import 'package:my_products/model/productpicture.dart';

import 'package:my_products/model/provider.dart';

import 'package:my_products/ui/widget/dropdown.dart';



import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  static const String routeName = 'AddProduct_Screen';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const AddProductScreen(),
    );
  }

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

 


  DateTime dateTime = DateTime(2022, 1, 1);
  late File imageFile;
  final formKey1 = GlobalKey<FormState>();

  final Languge _languge = Languge();

  File? _image;

  List<Products> porduct = [];
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }


  String? newname;
  String? newprice;
  String? newdescription;
  String? newima1;
  int newview = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOxfordBlueColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (formKey1.currentState!.validate()) {
                  //  Provider.of<ProviderInput>(context, listen: false)
                  //.addProducts(
                  //    newname!, newprice!, newima1!, newdescription!);
                  Provider.of<ProviderAddTask>(context, listen: false)
                      .addProducts(
                          _nameController.text,
                          _priceController.text,
                          _descriptionController.text,
                          _image.toString(),
                          newview);
                  Navigator.pop(context);
                  //Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                }
              },
              icon: Icon(Icons.check_circle_outline_rounded))
        ],
      ),
      body: SafeArea(
        child: Container(
          height: defaultScreenHeight,
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Form(
                  key: formKey1,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: kDefaultVerticalPadding),
                        child: Text(
                          _languge.tAddProduct(),
                          style: GoogleFonts.redHatMono(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      AddTextFormFiled(
                        hintText: _languge.tNameCar(),
                        icon: Icons.person,
                        type: TextInputType.name,
                        controller: _nameController,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Required'),
                          MaxLengthValidator(12, errorText: 'Max Length is 12')
                          // EmailValidator(errorText: 'Enter Valid Name')
                        ]),
                      ),
                      SizedBox(
                        height: kDefaultVerticalPadding,
                      ),
                      AddTextFormFiled(
                        icon: Icons.price_change,
                        hintText: _languge.tPriceCar(),
                        controller: _priceController,
                        type: TextInputType.number,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Required'),
                          MaxLengthValidator(4, errorText: 'Max Length is 4')
                        ]),
                      ),
                      SizedBox(
                        height: kDefaultVerticalPadding,
                      ),
                      AddTextFormFiled(
                        icon: Icons.description,
                        hintText: _languge.tDescription(),
                        controller: _descriptionController,
                        type: TextInputType.name,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Required'),
                          MaxLengthValidator(60, errorText: 'Max Length is 60')
                        ]),
                      ),
                      SizedBox(
                        height: kDefaultVerticalPadding,
                      ),
                      AddTextFormFiled(
                        icon: Icons.phone,
                        hintText: _languge.tPhone(),
                        controller: _phoneNumberController,
                        type: TextInputType.number,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Required'),
                          MaxLengthValidator(12, errorText: 'Max Length is 12'),
                          MinLengthValidator(10, errorText: 'Min Length is 10')
                        ]),
                      ),
                      SizedBox(
                        height: kDefaultVerticalPadding * 1.6,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: kDefaultRightPadding * 1.2),
                          child: Text(
                            _languge.tCategory(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kDefaultVerticalPadding,
                      ),
                      DropdownMenuItem(child: DropDowmList()),
                      SizedBox(
                        height: kDefaultVerticalPadding * 1.6,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: kDefaultLeftPadding * 1.3),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                          kOxfordBlueColor),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              side: BorderSide(
                                                  color: kOxfordBlueColor)))),
                                  onPressed: () async {
                                    DateTime? newdata = await showDatePicker(
                                      //_dateTime = (await showDatePicker(
                                      context: context,

                                      initialDate: dateTime,

                                      firstDate: DateTime(1990),
                                      lastDate: DateTime(2024),
                                    );
                                    if (newdata == null) {
                                      return;
                                    }
                                    setState(() => dateTime = newdata);

                                    //time = DateFormat('dd-MM-yy').format(_dateTime);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(_languge.tAddDate()),
                                  )),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: kDefaultLeftPadding),
                                child: Text(
                                  '${dateTime.year}/${dateTime.month}/${dateTime.day}',
                                  style: GoogleFonts.redHatMono(
                                    textStyle:
                                        TextStyle(fontSize: 20, letterSpacing: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kDefaultVerticalPadding,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(35),
                        child: Column(children: [
                          Center(
                            child: InkWell(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        kOxfordBlueColor),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            side: BorderSide(
                                                color: kOxfordBlueColor)))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: kDefaultVerticalPadding,
                                      horizontal: kDefaultHorizontalPadding * 2),
                                  child: Text(
                                    'Select Image',
                                    style: GoogleFonts.redHatMono(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  _openImagePicker();
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 300,
                            child: _image != null
                                ? Image.file(_image!, fit: BoxFit.cover)
                                : const Text(''),
                          )
                        ]),
                      ),
                      SizedBox(
                        height: kDefaultVerticalPadding,
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  /// Get from gallery
  Future getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        //  image = File(pickedFile.path) as Future<XFile?>;
      });
    }
  }


  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(color: kRichBlackColor),
          Container(
            margin: EdgeInsets.only(left: kDefaultHorizontalPadding * 0.5),
            child: Text(
              'Image Uploading...',
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
}

class AddTextFormFiled extends StatelessWidget {
  AddTextFormFiled({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.type,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  final IconData icon;
  final String hintText;
  final TextInputType type;
  final FieldValidator validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: kDefaultLeftPadding,
          top: kDefaultVerticalPadding,
          right: kDefaultRightPadding),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Required';
          }
          return null;
        },
        keyboardType: type,
        decoration: InputDecoration(
            //filled: true,
            //fillColor: kPlatinumColor,
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                left: kDefaultHorizontalPadding,
                right: kDefaultHorizontalPadding * 0.75,
              ),
              child: Icon(
                icon,
                size: 22,
                color: kOxfordBlueColor.withOpacity(0.6),
              ),
            ),
            hintText: hintText,
            border: const UnderlineInputBorder(
                // borderRadius: BorderRadius.circular(35),

                )),
      ),
    );
  }
}
