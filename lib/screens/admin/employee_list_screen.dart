import 'package:flutter/material.dart';
import '../../providers/employee_provider.dart';
import '../../widgets/employee_tile.dart';

class EmployeeListScreen extends StatelessWidget {
  final EmployeeProvider employeeProvider = EmployeeProvider();

  @override
  Widget build(BuildContext context) {
    final employees = employeeProvider.employees;
    return Scaffold(
      appBar: AppBar(title: Text('All Employees')),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          return EmployeeTile(employee: employees[index]);
        },
      ),
    );
  }
}
