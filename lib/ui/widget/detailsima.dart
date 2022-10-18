import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_products/constant/size.dart';

import 'package:my_products/model/productpicture.dart';

import '../../constant/color.dart';
import '../../model/languge.dart';

class DetailsBody extends StatefulWidget {
  final Products p;
  DetailsBody({
    Key? key,
    required this.p,
  }) : super(key: key);

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  @override
  Widget build(BuildContext context) {
    Languge _languge = Languge();

    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                  ),
                  color: kOxfordBlueColor,
                  image: DecorationImage(
                    image: NetworkImage(widget.p.ima1),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: kDefaultVerticalPadding, horizontal: 2),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 25),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          widget.p.name,
                          style: GoogleFonts.redHatMono(
                            textStyle: TextStyle(
                              fontSize: 40,
                              letterSpacing: 5,
                              fontWeight: FontWeight.bold,
                              // color: kBdazzledBlueColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: kDefaultLeftPadding),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '\$${widget.p.price}',
                          style: GoogleFonts.redHatMono(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              //  color: kBdazzledBlueColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: kDefaultVerticalPadding,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: kDefaultLeftPadding,
                          bottom: kDefaultVerticalPadding - 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _languge.tDescription(),
                          style: GoogleFonts.redHatMono(
                            textStyle: TextStyle(
                              fontSize: 20,
                              // color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: kDefaultLeftPadding),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.p.description,
                          style: GoogleFonts.redHatMono(
                            textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                // color: Colors.black87,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
