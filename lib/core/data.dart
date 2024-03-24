
import 'dart:convert';

import 'model/kit.dart';


class Data {

  static const String demoJson = """
  {
  "toolRoomList": [
    {
      "name": "开发",
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
          "title": "App调试",
          "commands": [
            {
              "name": "清空数据",
              "content": "adb shell pm clear com.lixiang.car.tuning"
            },
            {
              "name": "提取完整日志",
              "content": "adb pull ./log ~/Downloads/logs/"
            },
            {
              "name": "创建文件夹",
              "content": "mkdir -p ~/Downloads/logs"
            },
            {
              "name": "Kill",
              "content": "kp tuning"
            }
          ]
        },
        {
          "title": "App走查",
          "commands": [
            {
              "name": "截取主驾屏",
              "content": "adb exec-out screencap -d 0 -p > ~/Downloads/front_1.png"
            },
            {
              "name": "截取副驾屏",
              "content": "adb exec-out screencap -d 1 -p > ~/Downloads/rear_1.png"
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