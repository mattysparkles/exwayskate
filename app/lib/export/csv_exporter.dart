import 'dart:convert';

String exportToCsv(List<Map<String, dynamic>> rows) {
  if (rows.isEmpty) return '';
  final headers = rows.first.keys.toList();
  final buffer = StringBuffer();
  buffer.writeln(headers.join(','));
  for (final r in rows) {
    buffer.writeln(headers.map((h) => r[h]).join(','));
  }
  return buffer.toString();
}
