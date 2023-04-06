import 'package:employee_list/models/employee_model.dart';
import 'package:http/http.dart' as http;

class HelperServices {
  Future<List<Employee>> getEmployeeDetails() async {
    var client = http.Client();
    var uri = 'http://15.207.222.215:8080/api/employees';
    var url = Uri.parse(uri);
    var response = await client.get(url);
    try {
      if (response.statusCode == 200) {
        var json = response.body;
        print(response.body);
        return employeeFromJson(json);
        
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    throw Exception('failed to load employee list');
  }
}
