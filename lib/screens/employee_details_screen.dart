import 'package:employee_list/constants/colors.dart';
import 'package:employee_list/models/employee_model.dart';
import 'package:employee_list/utils/custom_appbar.dart';
import 'package:flutter/material.dart';
import '../utils/custom_text.dart';
import 'edit_employee_details_screen.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  const EmployeeDetailsScreen({super.key, required this.employee});
  final Employee employee;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppbar(title: 'Employee details'),
        body: SingleChildScrollView(
          child: Column(
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
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                        right: 12,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditEmployeeDetailsScreen(
                                employee: employee,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit_square,
                          color: Color(0XFF556080),
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 580,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/Blue Window.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/images/Profile Picture.png',
                      height: 113,
                      width: 113,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      employee.id.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        letterSpacing: 0.6,
                        color: Color(0XFFDFEAF0),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Text(
                      '${employee.empFirstName} ${employee.empLastName}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        letterSpacing: 0.6,
                        color: Color(0XFFDFEAF0),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomText(
                      text: employee.empGender.name,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomText(
                      text: employee.empDateOfBirth,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomText(
                      text: employee.empDateOfJoining,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomText(
                      text: employee.empPhoneNumber,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    CustomText(
                      text: employee.empEmailId,
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: '${employee.empHomeAddrLine1},'),
                        CustomText(text: employee.empHomeAddrLine2),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: '${employee.empHomeAddrStreet},'),
                        CustomText(text: '${employee.empHomeAddrDistrict},'),
                        CustomText(text: employee.empHomeAddrState),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(text: '${employee.empHomeAddrCountry} - '),
                        CustomText(text: employee.empHomeAddrPinCode),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 40, top: 20),
                          child: SizedBox(
                            width: 94,
                            height: 44,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                elevation: const MaterialStatePropertyAll(0),
                                backgroundColor:
                                    MaterialStateProperty.all(kbuttonColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditEmployeeDetailsScreen(
                                      employee: employee,
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Edit',
                                style: TextStyle(
                                  letterSpacing: 0.6,
                                  color: Color(0XFFFFFFFF),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
