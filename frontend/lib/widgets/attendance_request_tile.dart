import 'package:flutter/material.dart';
import '../models/attendance_request.dart';
import '../utils/date_time_utils.dart';

class AttendanceRequestTile extends StatelessWidget {
  final AttendanceRequest request;
  final VoidCallback? onApprove;
  final VoidCallback? onReject;

  AttendanceRequestTile({
    required this.request,
    this.onApprove,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        title: Text('Employee: ${request.employeeName} (${request.employeeId})'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Check-in: ${formatDateTime(request.checkIn)}'),
            Text('Check-out: ${request.checkOut != null ? formatDateTime(request.checkOut!) : 'N/A'}'),
            Text('Status: ${request.status.toString().split('.').last}'),
          ],
        ),
        trailing: request.status == AttendanceStatus.pending
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.check, color: Colors.green),
                    onPressed: onApprove,
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.red),
                    onPressed: onReject,
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
