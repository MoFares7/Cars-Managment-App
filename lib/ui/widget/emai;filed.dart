import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:my_products/constant/color.dart';
import 'package:my_products/constant/size.dart';

class TextFormEmail extends StatelessWidget {
  const TextFormEmail(
      {Key? key,
      required this.icon,
      required this.hintText,
      required this.validator,
      required this.controller})
      : super(key: key);

  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final FieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty ){
           return 'Required';
        } if(!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value)) {
          return 'Enter Valid email';
        } else {
          return null;
        }
        
      },
      keyboardType: TextInputType.emailAddress,
      autofillHints: [AutofillHints.email],
      decoration: InputDecoration(
          filled: true,
          fillColor: kPlatinumColor,
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
          
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide.none,
          )),
    );
  }
}
