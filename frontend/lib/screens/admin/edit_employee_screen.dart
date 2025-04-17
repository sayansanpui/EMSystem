import 'package:flutter/material.dart';
import '../../models/employee.dart';
import '../../providers/employee_provider.dart';

class EditEmployeeScreen extends StatefulWidget {
  final Employee employee;
  final EmployeeProvider provider;

  EditEmployeeScreen({required this.employee, required this.provider});

  @override
  _EditEmployeeScreenState createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.employee.name);
    _passwordController = TextEditingController(text: widget.employee.password);
  }

  void _save() {
    widget.provider.updateEmployee(
      widget.employee.id,
      _nameController.text,
      _passwordController.text,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Employee')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _save,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
