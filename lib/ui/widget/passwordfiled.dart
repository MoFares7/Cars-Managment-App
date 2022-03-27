import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:my_products/constant/color.dart';

import '../../constant/size.dart';

class PasswordUserFormFiled extends StatefulWidget {
  const PasswordUserFormFiled(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.icon,
      required this.validator})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final IconData icon;
  final FieldValidator validator;

  @override
  State<PasswordUserFormFiled> createState() => _PasswordFormFiledState();
}

bool _isPasswordVision = true;

class _PasswordFormFiledState extends State<PasswordUserFormFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: _isPasswordVision,
      decoration: InputDecoration(
        filled: true,
        fillColor: kPlatinumColor,
        prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: kDefaultHorizontalPadding,
              right: kDefaultHorizontalPadding * 0.75,
            ),
            child: Icon(
              Icons.lock,
              size: 22,
              color: kOxfordBlueColor.withOpacity(0.6),
            )),
        suffixIcon: Padding(
          padding: EdgeInsets.only(left: kDefaultHorizontalPadding * 0.4),
          child: IconButton(
            icon: Icon(
              _isPasswordVision ? Icons.visibility : Icons.visibility_off,
              size: 22,
              color: kOxfordBlueColor.withOpacity(0.6),
            ),
            onPressed: () {
              setState(() {
                _isPasswordVision = !_isPasswordVision;
              });
            },
          ),
        ),
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
