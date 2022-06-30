import 'package:flutter/material.dart';
import 'pages/loginPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue,
      ).copyWith(
        secondary: Colors.lightBlue,
      ),
    ),
    home: PaginaLogin(),
  ));
}
