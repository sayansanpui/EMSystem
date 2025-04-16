import 'package:flutter/material.dart';
import '../../providers/attendance_provider.dart';
import '../../widgets/attendance_request_tile.dart';
import '../login_screen.dart';

class ApproveRequestsScreen extends StatefulWidget {
  @override
  _ApproveRequestsScreenState createState() => _ApproveRequestsScreenState();
}

class _ApproveRequestsScreenState extends State<ApproveRequestsScreen> {
  final AttendanceProvider provider = AttendanceProvider();

  @override
  Widget build(BuildContext context) {
    final pendingRequests = provider.getPendingRequests();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pending Attendance Requests'),
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
      body: pendingRequests.isEmpty
          ? Center(child: Text('No pending requests'))
          : ListView.builder(
              itemCount: pendingRequests.length,
              itemBuilder: (context, index) {
                final request = pendingRequests[index];
                return AttendanceRequestTile(
                  request: request,
                  onApprove: () {
                    setState(() {
                      provider.approveRequest(
                        provider.requests.indexOf(request),
                      );
                    });
                  },
                  onReject: () {
                    setState(() {
                      provider.rejectRequest(
                        provider.requests.indexOf(request),
                      );
                    });
                  },
                );
              },
            ),
    );
  }
}
