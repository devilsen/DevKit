import 'dart:io';

class FileReader {
  static Future<String> read(String path) async {
    var file = File(path);
    if (!await file.exists()) {
      print("File not found: $path");
      return "";
    }

    return file.readAsString();
  }
}
