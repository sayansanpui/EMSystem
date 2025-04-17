import 'package:flutter/material.dart';
import '../models/employee.dart';
import '../data/hardcoded_data.dart';

class EmployeeProvider extends ChangeNotifier {
  List<Employee> _employees = List.from(hardcodedEmployees);

  List<Employee> get employees => _employees;

  void addEmployee(Employee employee) {
    _employees.add(employee);
    notifyListeners();
  }

  Employee? authenticate(String id, String password) {
    try {
      return _employees.firstWhere(
        (emp) => emp.id == id && emp.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  void updateEmployee(String id, String newName, String newPassword) {
    final index = _employees.indexWhere((e) => e.id == id);
    if (index != -1) {
      _employees[index] =
          Employee(id: id, name: newName, password: newPassword);
      notifyListeners();
    }
  }
}
