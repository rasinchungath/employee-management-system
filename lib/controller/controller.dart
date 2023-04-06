import 'package:employee_list/services/helper_services.dart';
import 'package:flutter/material.dart';

import '../models/employee_model.dart';

class Controller extends ChangeNotifier{

  List<Employee> employeeList=[];

  Future<void> getEmployeeList()async {

    employeeList = await HelperServices().getEmployeeDetails();

  }


}