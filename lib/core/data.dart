
import 'dart:convert';

import 'model/kit.dart';


class Data {

  static const String demoJson = """
  {
  "toolRoomList": [
    {
      "name": "Development Tools",
      "image": "path/to/development_tools.png",
      "toolBoxList": [
        {
          "title": "切换深浅颜色模式",
          "commands": [
            {
              "name": "浅色模式",
              "content": "adb shell cmd uimode night no"
            },
            {
              "name": "深色模式",
              "content": "adb shell cmd uimode night yes"
            }
          ]
        },
        {
          "title": "Design Tools",
          "commands": [
            {
              "name": "Figma",
              "content": "A web-based design tool for prototyping and collaboration."
            },
            {
              "name": "Adobe XD",
              "content": "A user experience design and prototyping tool."
            }
          ]
        }
      ]
    },
    {
      "name": "Productivity Tools",
      "image": "path/to/productivity_tools.png",
      "toolBoxList": [
        {
          "title": "Time Management",
          "commands": [
            {
              "name": "Pomodoro Technique",
              "content": "A time management method involving 25-minute work intervals."
            },
            {
              "name": "Eisenhower Matrix",
              "content": "A prioritization tool for tasks based on urgency and importance."
            }
          ]
        }
      ]
    }
  ]
}
  """;

  static Kit getKit() {
    return Kit.fromJson(json.decode(demoJson) as Map<String, dynamic>);
  }

}