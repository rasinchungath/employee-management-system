import 'package:employee_list/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'package:provider/provider.dart';

import 'controller/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Controller(),),
      ],
      child: MaterialApp(
        title: 'Employee Management System',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kBGcolor,
          primarySwatch: Colors.blueGrey,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
