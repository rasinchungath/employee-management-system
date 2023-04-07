import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import '../constants/constant.dart';
import '../controller/controller.dart';
import '../models/employee_model.dart';
import '../utils/custom_appbar.dart';
import '../utils/custom_button.dart';
import '../utils/custom_textfield.dart';
import '../utils/gender_selector.dart';
import 'home_screen.dart';

class AddEmployeeDetailsScreen extends StatefulWidget {
  const AddEmployeeDetailsScreen({super.key});

  @override
  State<AddEmployeeDetailsScreen> createState() =>
      _AddEmployeeDetailsScreenState();
}

class _AddEmployeeDetailsScreenState extends State<AddEmployeeDetailsScreen> {
  EmpGender selectedGender = EmpGender.MALE;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController empIDController = TextEditingController();
  TextEditingController dObController = TextEditingController();
  TextEditingController dOjController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController adLine1Controller = TextEditingController();
  TextEditingController adLine2Controller = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  bool isEmailRegistered(String email, List<Employee> employeeList) {
    for (Employee employee in employeeList) {
      if (employee.empEmailId == email) {
        return true;
      }
    }
    return false;
  }

  bool isMobRegistered(String phone, List<Employee> employeeList) {
    for (Employee employee in employeeList) {
      if (employee.empPhoneNumber == phone) {
        return true;
      }
    }
    return false;
  }

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: customAppbar(title: 'Add Employee details'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 20, top: 16, bottom: 16),
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
                    CustomButton(
                      onPressed: () async{
                         await addEmployee();
                      },
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
                        children: [
                          CustomTextField(
                            keyboardType: TextInputType.number,
                            controller: empIDController,
                            hintText: 'Employee ID',
                          ),
                          const SizedBox(
                            width: 35,
                          ),
                          const CircleAvatar(
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
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                              keyboardType: TextInputType.name,
                              controller: firstNameController,
                              hintText: 'First name'),
                          CustomTextField(
                              keyboardType: TextInputType.name,
                              controller: lastNameController,
                              hintText: 'Last name'),
                        ],
                      ),
                      GenderSelector(
                        dropDown: DropdownButton<EmpGender>(
                          hint: const Text(
                            'Gender',
                            style: kcustomFieldStyle,
                          ),
                          value: selectedGender,
                          onChanged: (newValue) {
                            setState(() {
                              selectedGender = newValue!;
                            });
                            print(selectedGender.toString());
                          },
                          underline: Container(color: Colors.transparent),
                          isExpanded: true,
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Image.asset(
                              'assets/images/Dropdown Icon.png',
                              height: 18,
                              width: 18,
                            ),
                          ),
                          items: EmpGender.values.map((gender) {
                            return DropdownMenuItem<EmpGender>(
                              value: gender,
                              child: Text(
                                gender.name,
                                style: kcustomFieldStyle,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      CustomTextField(
                        keyboardType: TextInputType.datetime,
                        controller: dObController,
                        hintText: 'Date of Birth',
                      ),
                      CustomTextField(
                          keyboardType: TextInputType.datetime,
                          controller: dOjController,
                          hintText: 'Date of Joining'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                              hintText: 'Phone Number'),
                          CustomTextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            hintText: 'Email',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                              keyboardType: TextInputType.name,
                              controller: adLine1Controller,
                              hintText: 'Address Line 1'),
                          CustomTextField(
                              keyboardType: TextInputType.name,
                              controller: adLine2Controller,
                              hintText: 'Address Line 2'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                            keyboardType: TextInputType.name,
                            controller: streetController,
                            hintText: 'Street',
                          ),
                          CustomTextField(
                            keyboardType: TextInputType.name,
                            controller: districtController,
                            hintText: 'District',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                            keyboardType: TextInputType.name,
                            controller: stateController,
                            hintText: 'State',
                          ),
                          CustomTextField(
                            keyboardType: TextInputType.name,
                            controller: countryController,
                            hintText: 'Country',
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                              keyboardType: TextInputType.number,
                              controller: pinController,
                              hintText: 'Pin Code'),
                          const SizedBox(
                            width: 35,
                          ),
                          CustomButton(
                            onPressed: () async {
                              await addEmployee();
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addEmployee() async {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty) {
      bool email =
          isEmailRegistered(emailController.text, controller.employeeList);
      bool phone =
          isMobRegistered(phoneController.text, controller.employeeList);
      if (email == false && phone == false) {
        var employee = Employee(
          empFirstName: firstNameController.text,
          empLastName: lastNameController.text,
          empGender: selectedGender,
          empDateOfBirth: dObController.text,
          empDateOfJoining: dOjController.text,
          empPhoneNumber: phoneController.text,
          empEmailId: emailController.text,
          empHomeAddrLine1: adLine1Controller.text,
          empHomeAddrLine2: adLine2Controller.text,
          empHomeAddrStreet: streetController.text,
          empHomeAddrDistrict: districtController.text,
          empHomeAddrState: stateController.text,
          empHomeAddrCountry: countryController.text,
          empHomeAddrPinCode: pinController.text,
        );
        await controller.addEmployee(employee: employee);

        Get.offAll(const HomeScreen());
      } else {
        Get.snackbar(
          'Email or phone is already Registered',
          'please fill another email or phone',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color(0XFF556080),
          colorText: const Color(0XFFE6FAFC),
        );
      }
    } else {
      Get.snackbar(
        'Some fields are missing',
        'Please fill First and Last name',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color(0XFF556080),
        colorText: const Color(0XFFE6FAFC),
      );
    }
  }
}
