import 'package:flutter/material.dart';
import 'package:my_products/constant/color.dart';
import 'package:my_products/model/productpicture.dart';
import 'package:my_products/ui/widget/detailsima.dart';
import 'package:my_products/model/productpicture.dart';

class DetailsScreen extends StatelessWidget {
  final Products products;
  DetailsScreen({Key? key, required this.products}) : super(key: key);

  static const String routeName = 'Add_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsBody(
        p: products,
      ),
    );
  }
}
