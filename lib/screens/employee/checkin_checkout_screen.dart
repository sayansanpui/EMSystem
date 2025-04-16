import 'package:flutter/material.dart';
import '../../providers/attendance_provider.dart';
import '../../models/attendance_request.dart';

class CheckInCheckOutScreen extends StatefulWidget {
  final String employeeId;

  CheckInCheckOutScreen({required this.employeeId});

  @override
  _CheckInCheckOutScreenState createState() => _CheckInCheckOutScreenState();
}

class _CheckInCheckOutScreenState extends State<CheckInCheckOutScreen> {
  final AttendanceProvider attendanceProvider = AttendanceProvider();
  DateTime? checkInTime;
  DateTime? checkOutTime;

  void _checkIn() {
    setState(() {
      checkInTime = DateTime.now();
      attendanceProvider.addRequest(
        AttendanceRequest(
          employeeId: widget.employeeId,
          employeeName: widget.employeeId, // Replace with employee name if needed
          checkIn: checkInTime!,
        ),
      );
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Check-in request sent!')));
  }

  void _checkOut() {
    setState(() {
      checkOutTime = DateTime.now();
      // Find the latest pending request for this employee
      final requests = attendanceProvider.getRequestsByEmployee(widget.employeeId);
      if (requests.isNotEmpty) {
        final lastRequest = requests.last;
        lastRequest.checkOut = checkOutTime;
      }
    });
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Check-out request sent!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check-in / Check-out')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: checkInTime == null ? _checkIn : null,
              child: Text('Check-in'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (checkInTime != null && checkOutTime == null) ? _checkOut : null,
              child: Text('Check-out'),
            ),
            SizedBox(height: 40),
            if (checkInTime != null)
              Text('Checked in at: ${checkInTime.toString()}'),
            if (checkOutTime != null)
              Text('Checked out at: ${checkOutTime.toString()}'),
          ],
        ),
      ),
    );
  }
}
