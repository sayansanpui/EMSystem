import 'package:flutter/material.dart';
import '../../providers/employee_provider.dart';
import '../../widgets/employee_tile.dart';
import '../login_screen.dart';

class EmployeeListScreen extends StatelessWidget {
  final EmployeeProvider employeeProvider = EmployeeProvider();

  @override
  Widget build(BuildContext context) {
    final employees = employeeProvider.employees;
    return Scaffold(
      appBar: AppBar(
        title: Text('All Employees'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
                (route) => false,
              );
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          return EmployeeTile(employee: employees[index]);
        },
      ),
    );
  }
}
