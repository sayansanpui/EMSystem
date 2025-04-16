import 'package:flutter/material.dart';
import 'approve_requests_screen.dart';
import 'create_employee_screen.dart';
import 'employee_list_screen.dart';
import '../login_screen.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Approve Attendance Requests'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ApproveRequestsScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Create New Employee'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CreateEmployeeScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('View All Employees'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => EmployeeListScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
