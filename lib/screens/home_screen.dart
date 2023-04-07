import 'package:employee_list/constants/colors.dart';
import 'package:employee_list/screens/add_employee_details_screen.dart';
import 'package:employee_list/screens/employee_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/constant.dart';
import '../controller/controller.dart';
import '../utils/alert_dialogue.dart';
import '../utils/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return GetBuilder(
        init: Controller(),
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              appBar: homeAppbar,
              body: controller.employeeList == null
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0XFF556080),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(23.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 35,
                                  width: 190,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: const Color(0xFFC9C9CB),
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    color: const Color(0XFFE7ECED),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      top: 5,
                                      bottom: 5,
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/Lens Icon.png',
                                          height: 13,
                                          width: 13,
                                        ),
                                        Flexible(
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.all(
                                                8.5,
                                              ),
                                              hintText: 'Search',
                                              hintStyle: kSearchStyle,
                                              border: InputBorder.none,
                                            ),
                                            style: kSearchStyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {},
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.0),
                                      color: const Color(0XFF556080),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      size: 35,
                                      color: kBGcolor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.employeeList.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ListTile(
                                minLeadingWidth: 7,
                                onTap: () {
                                  Get.to(EmployeeDetailsScreen(
                                      employee:
                                          controller.employeeList[index]));
                                },
                                onLongPress: () {
                                  showAlertDialog(
                                    context: context,
                                    onPressed: () async {
                                      Get.back();
                                      await controller.deleteEmployee(
                                          controller.employeeList[index].id);
                                      Get.snackbar(
                                        'Deleted',
                                        'Employee detail deleted successfully',
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor:
                                            const Color(0XFF556080),
                                        colorText: const Color(0XFFE6FAFC),
                                      );
                                    },
                                  );
                                },
                                leading: Image.asset(
                                  'assets/images/Profile Picture 1.png',
                                  height: 32,
                                  width: 32,
                                ),
                                title: Text(
                                  '${controller.employeeList[index].empFirstName} ${controller.employeeList[index].empLastName}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0XFF41485F),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(right: 12, bottom: 18),
                child: InkWell(
                  onTap: () {
                    Get.to(
                      const AddEmployeeDetailsScreen(),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: const Color(0XFF556080),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 50,
                      color: kBGcolor,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
