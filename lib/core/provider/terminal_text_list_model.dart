import 'package:flutter/material.dart';

class TerminalTextListModel extends ChangeNotifier {
  List<String> _textList = [];

  List<String> get textList => _textList;

  void updateList(List<String> textList) {
    print("Selected tool room: $_textList");
    _textList = textList;
    notifyListeners();
  }

  void add(String text) {
    print("text add: $text");

    if (_textList.length > 100) {
      _textList.removeAt(0);
    }
    _textList.add(text);
    notifyListeners();
  }
}
