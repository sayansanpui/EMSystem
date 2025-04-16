import 'package:flutter/material.dart';
import '../data/hardcoded_data.dart';
import 'admin/admin_dashboard.dart';
import 'employee/employee_dashboard.dart';
import 'package:collection/collection.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _error;

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    // Check admin (hardcoded)
    if (username == 'admin' && password == 'admin123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => AdminDashboard()),
      );
      return;
    }

    // Check employee
    final employee = hardcodedEmployees.firstWhereOrNull(
      (e) => e.id == username && e.password == password,
    );

    if (employee != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => EmployeeDashboard(employee: employee),
        ),
      );
      return;
    }

    setState(() {
      _error = 'Invalid username or password';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_error != null)
              Text(_error!, style: TextStyle(color: Colors.red)),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username (ID)'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
