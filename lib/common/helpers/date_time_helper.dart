import 'package:intl/intl.dart';

extension DateTimeHelper on DateTime {
  String toLocalizedDate({String locale = 'es_ES'}) {
    final formatterMonth = DateFormat('MMM.', locale);
    final formatterYear = DateFormat('y', locale);
    return '${formatterMonth.format(this)} ${formatterYear.format(this)}';
  }
}
