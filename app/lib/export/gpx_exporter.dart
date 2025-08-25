String exportToGpx(List<Map<String, double>> samples) {
  final buffer = StringBuffer();
  buffer.writeln('<gpx><trk><trkseg>');
  for (final s in samples) {
    buffer.writeln(
        '<trkpt lat="${s['lat']}" lon="${s['lon']}"><time>${DateTime.now().toIso8601String()}</time></trkpt>');
  }
  buffer.writeln('</trkseg></trk></gpx>');
  return buffer.toString();
}
