import 'package:flutter/material.dart';
import '../../models/employee.dart';
import 'checkin_checkout_screen.dart';

class EmployeeDashboard extends StatelessWidget {
  final Employee employee;
  const EmployeeDashboard({Key? key, required this.employee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Employee Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${employee.name}!'),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        CheckInCheckOutScreen(employeeId: employee.id),
                  ),
                );
              },
              child: Text('Check-in / Check-out'),
            ),
          ],
        ),
      ),
    );
  }
}
