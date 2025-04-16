import 'package:flutter/material.dart';
import '../models/attendance_request.dart';

class AttendanceProvider extends ChangeNotifier {
  final List<AttendanceRequest> _requests = [];

  List<AttendanceRequest> get requests => _requests;

  void addRequest(AttendanceRequest request) {
    _requests.add(request);
    notifyListeners();
  }

  void approveRequest(int index) {
    _requests[index].status = AttendanceStatus.approved;
    notifyListeners();
  }

  void rejectRequest(int index) {
    _requests[index].status = AttendanceStatus.rejected;
    notifyListeners();
  }

  List<AttendanceRequest> getPendingRequests() {
    return _requests.where((req) => req.status == AttendanceStatus.pending).toList();
  }

  List<AttendanceRequest> getRequestsByEmployee(String employeeId) {
    return _requests.where((req) => req.employeeId == employeeId).toList();
  }
}
