
import 'package:flutter/material.dart';

import 'package:my_products/main.dart';
import 'package:my_products/model/productpicture.dart';

class ProviderData extends ChangeNotifier {
  ThemeData _themeData = darkMode ? ThemeData.dark() : ThemeData.light();

  ProviderData(ThemeData themeData);

  getTheme() {
    return _themeData;
  }

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}

class ProviderAddTask extends ChangeNotifier {
  List<Products> product1 = [
    Products(
      'Mercedes',
      '1099',
      ' This Car is very strong and in additon its cheaper This car is motor 3000 css and V6 cylender',
      'https://images.unsplash.com/photo-1595925889916-2a1d773a0613?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWVyY2VkZXMlMjBjYXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      0,
    ),
    Products(
        'Volvo',
        '2000',
        ' This Car is very strong and in additon its cheaper This car is motor 3200 css and V6 cylender',
        'https://images.unsplash.com/photo-1629897048514-3dd7414fe72a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8dm9sdm98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
        0),
    Products(
        'Ferrari',
        '4000',
        ' This Car is very strong and in additon its cheaper This car is motor 6000 css and V12 cylender',
        'https://images.unsplash.com/photo-1583121274602-3e2820c69888?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZmVycmFyaXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        0),
    Products(
        'BMW',
        '3200',
        ' This Car is very strong and in additon its cheaper This car is motor 3200 css and V6 cylender',
        'https://images.unsplash.com/photo-1583356322882-85559b472f56?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Ym13JTIwY2FyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
        0),
    Products(
        'Mitsubishi',
        '8000',
        ' This Car is very strong and in additon its cheaper This car is motor 1800 css and V4 cylender',
        'https://images.unsplash.com/photo-1558199099-ab7fa8a61cb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWl0c3ViaXNoaXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
        0),
    Products(
        'BMW - M5',
        '1800',
        ' This Car is very strong and in additon its cheaper This car is motor 2000 css and V4 cylender',
        'https://images.unsplash.com/flagged/photo-1553505192-acca7d4509be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym13fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
        0),
  ];

  void addProducts(
      String name, String price, String description, String ima1, int view) {
    product1.add(Products(name, price, description, ima1, view));
    notifyListeners();
  }

  void deleteTask(Products products) {
    product1.remove(products);
    notifyListeners();
  }
}

List<Products> product1 = [
  Products(
    'Mercedes',
    '1099',
    ' This Car is very strong and in additon its cheaper This car is motor 3000 css and V6 cylender',
    'https://images.unsplash.com/photo-1595925889916-2a1d773a0613?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWVyY2VkZXMlMjBjYXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    0,
  ),
  Products(
      'Volvo',
      '2000',
      ' This Car is very strong and in additon its cheaper This car is motor 3200 css and V6 cylender',
      'https://images.unsplash.com/photo-1629897048514-3dd7414fe72a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8dm9sdm98ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
      0),
  Products(
      'Ferrari',
      '4000',
      ' This Car is very strong and in additon its cheaper This car is motor 6000 css and V12 cylender',
      'https://images.unsplash.com/photo-1583121274602-3e2820c69888?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZmVycmFyaXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      0),
  Products(
      'BMW',
      '3200',
      ' This Car is very strong and in additon its cheaper This car is motor 3200 css and V6 cylender',
      'https://images.unsplash.com/photo-1583356322882-85559b472f56?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Ym13JTIwY2FyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      0),
  Products(
      'Mitsubishi',
      '8000',
      ' This Car is very strong and in additon its cheaper This car is motor 1800 css and V4 cylender',
      'https://images.unsplash.com/photo-1558199099-ab7fa8a61cb4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bWl0c3ViaXNoaXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      0),
  Products(
      'BMW - M5',
      '1800',
      ' This Car is very strong and in additon its cheaper This car is motor 2000 css and V4 cylender',
      'https://images.unsplash.com/flagged/photo-1553505192-acca7d4509be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Ym13fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      0),
];
