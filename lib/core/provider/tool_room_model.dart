import 'package:flutter/material.dart';

import '../model/tool_room.dart';

class ToolRoomModel extends ChangeNotifier {
  ToolRoom _selectedToolRoom = ToolRoom(name: '', image: '', toolBoxList: []);

  ToolRoom get selectedToolRoom => _selectedToolRoom;

  void updateSelectedToolRoom(ToolRoom toolRoom) {
    print("Selected tool room: $_selectedToolRoom");
    _selectedToolRoom = toolRoom;
    notifyListeners();
  }
}
