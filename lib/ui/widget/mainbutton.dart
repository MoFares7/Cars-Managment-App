import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:my_products/constant/size.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.backgroundColor,
    this.textColor,
    this.label,
    this.loadingWidget,
    required this.onPressed,
  }) : super(key: key);
  final Color backgroundColor;
  final Color? textColor;
  final String? label;
  final Widget? loadingWidget;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
      color: backgroundColor,
      child: loadingWidget ??
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultVerticalPadding * 0.75,
              horizontal: kDefaultHorizontalPadding / 2,
            ),
            child: Text(
              label!,
              style: GoogleFonts.redHatMono(
                  textStyle: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ),
    );
  }
}
