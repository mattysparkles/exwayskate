import 'dart:convert';
import 'dart:io';

const _blankPngBase64 = 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8/x8AAusB9Y1/4jwAAAAASUVORK5CYII=';

void ensureGolden(String name) {
  final file = File('test/goldens/\$name.png');
  if (!file.existsSync()) {
    file.createSync(recursive: true);
    file.writeAsBytesSync(base64Decode(_blankPngBase64));
  }
}
