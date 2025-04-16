import 'package:flutter/material.dart';
import '../models/employee.dart';

class EmployeeTile extends StatelessWidget {
  final Employee employee;

  EmployeeTile({required this.employee});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(employee.name),
      subtitle: Text('ID: ${employee.id}'),
    );
  }
}
