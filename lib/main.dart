import 'package:employee_list/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Employee Management System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBGcolor,
        primarySwatch: Colors.blueGrey,
      ),
      home:  HomeScreen(),
    );
  }
}
