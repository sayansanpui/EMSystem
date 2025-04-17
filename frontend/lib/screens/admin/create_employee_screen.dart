import 'package:flutter/material.dart';
import '../../models/employee.dart';
import '../../providers/employee_provider.dart';
import '../login_screen.dart';

class CreateEmployeeScreen extends StatefulWidget {
  @override
  _CreateEmployeeScreenState createState() => _CreateEmployeeScreenState();
}

class _CreateEmployeeScreenState extends State<CreateEmployeeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  final EmployeeProvider employeeProvider = EmployeeProvider();

  void _createEmployee() {
    if (_formKey.currentState!.validate()) {
      final newEmployee = Employee(
        id: _idController.text,
        name: _nameController.text,
        password: _passwordController.text,
      );
      employeeProvider.addEmployee(newEmployee);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Employee Created!')),
      );
      _idController.clear();
      _nameController.clear();
      _passwordController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Employee'),
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(labelText: 'Employee ID'),
                validator: (value) => value!.isEmpty ? 'Please enter ID' : null,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Employee Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter name' : null,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter password' : null,
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createEmployee,
                child: Text('Create'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
