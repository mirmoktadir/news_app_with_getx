import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_x_test/views/screens/home_screen.dart';

void main() {
  runApp(NewsX());
}

class NewsX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News X',
      theme: ThemeData(
        primaryColor: Colors.white, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red,),
      ),
      home: HomeScreen(),
    );
  }
}
