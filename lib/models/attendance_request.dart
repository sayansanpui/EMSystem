enum AttendanceStatus { pending, approved, rejected }

class AttendanceRequest {
  final String employeeId;
  final String employeeName;
  final DateTime checkIn;
  DateTime? checkOut;
  AttendanceStatus status;

  AttendanceRequest({
    required this.employeeId,
    required this.employeeName,
    required this.checkIn,
    this.checkOut,
    this.status = AttendanceStatus.pending,
  });
}
