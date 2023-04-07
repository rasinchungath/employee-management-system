import 'dart:convert';
import 'package:employee_list/models/employee_model.dart';
import 'package:http/http.dart' as http;

class HelperServices {
  var client = http.Client();
  var uri = 'http://15.207.222.215:8080/api/employees';

  Future<List<Employee>> getEmployeeDetails() async {
    var url = Uri.parse(uri);
    var response = await client.get(url);
    try {
      if (response.statusCode == 200) {
        var json = response.body;
        return employeeFromJson(json);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    throw Exception('failed to load employee list');
  }

  Future<void> updateDetails(
      {required int? id, required Employee employee}) async {
    print('update');
    final url = Uri.parse('$uri/$id');
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    final body = jsonEncode(employee.toJson());
    final response = await client.put(
      url,
      headers: headers,
      body: body,
    );
    print(response.statusCode);
    try {
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      throw Exception('Failed to update employee');
    }
  }

  Future<void> addEmployee({required Employee employee}) async {
    print('update');
    final url = Uri.parse(uri);
    final headers = <String, String>{
      'Content-Type': 'application/json',
    };
    final body = jsonEncode(employee.toJson());
    final response = await client.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.statusCode);
    print('add details here');
    try {
      if (response.statusCode == 200) {
        print(response.body);
      }
    } catch (e) {
      throw Exception('Failed to update employee');
    }
  }

 

  Future<void> deleteEmployee({
    required int? id,
  }) async {
    print(id);
    final url = Uri.parse('$uri/$id');
    try {
      final response = await http.delete(url);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('sucess');
      }
    } catch (e) {
      throw Exception('failed to delete employee');
    }
  }
}
