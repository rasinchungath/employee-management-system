import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/custom_appbar.dart';
import '../utils/custom_button.dart';
import '../utils/custom_textfield.dart';

class AddEmployeeDetailsScreen extends StatelessWidget {
  const AddEmployeeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppbar(title: 'Add Employee details'),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 0, right: 10, top: 16, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    elevation: 0,
                    fillColor: const Color(0XFF556080),
                    padding: const EdgeInsets.all(0),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.arrow_back,
                      color: kBGcolor,
                      size: 30.0,
                    ),
                  ),
                  const CustomButton(),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/Blue Window.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          CustomTextField(
                            hintText: 'Employee ID',
                          ),
                          SizedBox(
                            width: 35,
                          ),
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Color(0XFFDFEAF0),
                            child: Text(
                              'Add\nProfile\nPicture',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                letterSpacing: 0.6,
                                color: Color(0xFF929495),
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomTextField(hintText: 'First name'),
                          CustomTextField(hintText: 'Last name'),
                        ],
                      ),
                      CustomTextField(hintText: 'Gender'),
                      CustomTextField(hintText: 'Date of Birth'),
                      CustomTextField(hintText: 'Date of Joining'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomTextField(hintText: 'Phone Number'),
                          CustomTextField(hintText: 'Email'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomTextField(hintText: 'Address Line 1'),
                          CustomTextField(hintText: 'Address Line 2'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomTextField(hintText: 'Street'),
                          CustomTextField(hintText: 'District'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomTextField(hintText: 'State'),
                          CustomTextField(hintText: 'Country'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CustomTextField(hintText: 'Pincode'),
                          SizedBox(width: 35,),
                          CustomButton(),
                        ],
                      )
                      
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
