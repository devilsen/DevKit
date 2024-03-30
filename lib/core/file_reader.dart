import 'dart:io';

class FileReader {
  static Future<List<String>> readDirectoryJson(String directoryPath) async {
    List<String> jsonList = [];

    var directory = Directory(directoryPath);
    if (!await directory.exists()) {
      print("Directory not found: $directoryPath");
      return jsonList;
    }

    for (var entity in directory.listSync()) {
      if (entity is File) {
        if (entity.path.endsWith(".json")) {
          var jsonString = await readJson(entity.path);
          jsonList.add(jsonString);
        }
      }
    }

    return jsonList;
  }

  static Future<String> readJson(String path) async {
    var file = File(path);
    if (!await file.exists()) {
      print("File not found: $path");
      return "";
    }

    return file.readAsString();
  }
}
