
import 'dart:convert';

import 'file_reader.dart';
import 'model/kit.dart';


class Data {

  static Future<Kit> getKit() async{
    return FileReader.read("data/official.json").then((jsonString) {
      print(jsonString);
      return Kit.fromJson(json.decode(jsonString) as Map<String, dynamic>);
    });
  }

}