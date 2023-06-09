import 'package:flutter/material.dart';
import '../constants/constant.dart';

AppBar homeAppbar = AppBar(
  toolbarHeight: 140,
  flexibleSpace: Container(
    height: 140,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/Top Header.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 22, bottom: 22, right: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Expanded(
            child: Text(
              'EMPLOYEE',
              style: kAppBarTextstyle,
            ),
          ),
          Expanded(
            child: Text(
              'MANAGEMENT',
              style: kAppBarTextstyle,
            ),
          ),
          Expanded(
            child: Text(
              'SYSTEM',
              style: kAppBarTextstyle,
            ),
          ),
        ],
      ),
    ),
  ),
);
