import 'package:flutter/material.dart';
import 'package:my_products/constant/size.dart';

class DropDowmList extends StatefulWidget {
  const DropDowmList({Key? key}) : super(key: key);

  @override
  State<DropDowmList> createState() => _DropDowmListState();
}

class _DropDowmListState extends State<DropDowmList> {
  String? selectedValue = 'BMW';
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultHorizontalPadding * 2, vertical: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Form(
          key: _dropdownFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                   //s fillColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  validator: (value) =>
                      value == null ? "Select a category" : null,
                  // dropdownColor: Color.fromARGB(255, 253, 253, 253),
                  value: selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: dropdownItems),
            ],
          )),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("BMW"), value: "BMW"),
    DropdownMenuItem(child: Text("Mercades"), value: "Mercades"),
    DropdownMenuItem(child: Text("Volovo"), value: "Volovo"),
    DropdownMenuItem(child: Text("Ferrari"), value: "Ferrari"),
    DropdownMenuItem(child: Text("Other"), value: "Other"),
  ];
  return menuItems;
}
