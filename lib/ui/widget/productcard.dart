import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_products/model/productpicture.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/color.dart';
import '../../constant/size.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    Key? key,
    required this.itemIndex,
    required this.products,
    required this.press,
    required this.listTileDelete,
  }) : super(key: key);
  final int itemIndex;
  final Products products;
  final Function press;
  final void Function() listTileDelete;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

var _selectedView;
bool _isLike = true;
void like() {}

class _ProductCardState extends State<ProductCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSelected();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: widget.listTileDelete,
      onTap: () async {
        widget.press();

        var t = widget.products.view++;

        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString('view', t.toString());

        setState(() {
          _selectedView = t;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: ScreenUtil().setHeight(100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              color: kOxfordBlueColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.products.ima1),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: kDefaultVerticalPadding,
                          horizontal: kDefaultHorizontalPadding - 20),
                      child: Text(
                        widget.products.name,
                        style: GoogleFonts.redHatMono(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            _isLike = !_isLike;
                          });
                        },
                        icon: Icon(
                          _isLike
                              ? Icons.favorite_border_outlined
                              : Icons.favorite,
                          color: Colors.white,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: kDefaultVerticalPadding / 2,
                          horizontal: kDefaultHorizontalPadding - 20),
                      child: Text(
                        '\$${widget.products.price}',
                        style: GoogleFonts.redHatMono(
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: kDefaultRightPadding),
                        child: Icon(
                          Icons.visibility,
                          color: Colors.white,
                        )),
                    Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: Text(
                          widget.products.view.toString(),
                          style: GoogleFonts.redHatMono(
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            )),
      ),
    );
  }

  getSelected() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      _selectedView = preferences.getString('view');
    });
  }
}
