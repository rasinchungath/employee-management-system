import 'package:flutter/material.dart';

import '../constants/constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8,),
      child: Container(
        height: 30,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFFFFF),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(20),
          color: const Color(0XFFDFEAF0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 5,
            bottom: 3,
          ),
          child: TextFormField(
            decoration:  InputDecoration(
              contentPadding: const EdgeInsets.all(
                8.5,
              ),
              hintText: hintText,
              hintStyle: kcustomFieldStyle,
              border: InputBorder.none,
            ),
            style:kcustomFieldStyle,
          ),
        ),
      ),
    );
  }
}