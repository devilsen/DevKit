
import 'dart:convert';

import 'file_reader.dart';
import 'model/kit.dart';


class Data {

  static Future<Kit> getKit() async{
    return FileReader.readDirectoryJson("data").then((jsonList) {
      List<Kit> kitList = [];
      for (var jsonString in jsonList) {
        print(jsonString);
        try {
          var kit = Kit.fromJson(json.decode(jsonString) as Map<String, dynamic>);
          kitList.add(kit);
        } catch (e) {
          print(e);
        }
      }

      return mergeKitList(kitList);
    });
  }

  static Future<Kit> mergeKitList(List<Kit> kitList) {
    if (kitList.isEmpty) {
      return Future.value(Kit.empty());
    }

    Kit kit = kitList[0];
    for (int i = 1; i < kitList.length; i++) {
      kit.toolRoomList.addAll(kitList[i].toolRoomList);
    }
    return Future.value(kit);

  }

}