import 'package:e_commerce/assets/colors.dart';
import 'package:e_commerce/assets/provider/cart.dart';
import 'package:e_commerce/pages/check_out.dart';
import 'package:e_commerce/pages/home.dart';
import 'package:e_commerce/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce',
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              
              titleTextStyle:TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
              backgroundColor: DarkGreen,
              toolbarHeight: 70,
              toolbarTextStyle: TextStyle(color: Colors.white),
            ),
            iconTheme: IconThemeData(color: Colors.white)),
        home: Home(),
      ),
    );
  }
}
