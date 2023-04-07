import 'package:employee_list/services/helper_services.dart';
import 'package:get/get.dart';
import '../models/employee_model.dart';

class Controller extends GetxController {
  List<Employee> employeeList = [];

  @override
  void onInit() {
    super.onInit();
    getEmployeeList();
  }

  Future<void> getEmployeeList() async {
    employeeList = await HelperServices().getEmployeeDetails();
    update();
  }

  Future<void> deleteEmployee(int? id) async {
    await HelperServices().deleteEmployee(id: id);
    getEmployeeList();
  }

  Future<void> editEmployee({required int? id, required Employee employee}) async {
    await HelperServices().updateDetails(id: id, employee: employee);
    getEmployeeList();
  }

   Future<void> addEmployee({required Employee employee}) async {
    await HelperServices().addEmployee(employee: employee);
    getEmployeeList();
  }




}
