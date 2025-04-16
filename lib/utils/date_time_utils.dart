import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final formatter = DateFormat('yyyy-MM-dd HH:mm');
  return formatter.format(dateTime);
}
