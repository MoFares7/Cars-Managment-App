
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItem extends StatelessWidget {
  MenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);
  final IconData icon;
  final String title;

  final Function press;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          press();
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                 // color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: GoogleFonts.redHatMono(
                          textStyle:TextStyle(    
                  //  color: Colors.black,
                    fontSize: 16,
                  ),
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
