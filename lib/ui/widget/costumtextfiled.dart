import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:my_products/constant/color.dart';
import 'package:my_products/constant/size.dart';

class CostumTextFormFiled extends StatelessWidget {
  const CostumTextFormFiled({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.icon1,
  }) : super(key: key);

  final IconData icon;
  final String hintText;
  final IconData icon1;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required';
        }
        return null;
      },
      keyboardType: TextInputType.name,
      autofillHints: [AutofillHints.name],
      decoration: InputDecoration(
          filled: true,
          fillColor: kPlatinumColor,
          hintText: hintText,
          prefixIcon: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
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
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: kDefaultVerticalPadding,
                    horizontal: kDefaultHorizontalPadding),
                child: Icon(
                  icon1,
                  size: 22,
                ),
              ),
            ],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide.none,
          )),
    );
  }
}

class UserNameFormCustomer extends StatelessWidget {
  const UserNameFormCustomer({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.validator,
    required this.onChanged,
  }) : super(key: key);

  final IconData icon;
  final String hintText;
  final FieldValidator validator;
  final Function onChanged;

  final String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required';
        }
        return null;
      },
      onChanged: onChanged(),
      keyboardType: TextInputType.name,
      autofillHints: [AutofillHints.name],
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
