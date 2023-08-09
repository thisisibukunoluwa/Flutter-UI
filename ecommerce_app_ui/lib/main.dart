import 'package:ecommerce_app_ui/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home:HomePage(),
    theme:ThemeData(
      fontFamily: 'Poppins'
    ),
  ));
}
