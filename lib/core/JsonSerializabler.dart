import 'package:devkit/feature/model/command.dart';

class JsonInterpreter {
  static const String demoJson = """
  {
  "categoryList": [
    {
      "name": "Development Tools",
      "image": "path/to/development_tools.png",
      "toolBoxList": [
        {
          "title": "Git Commands",
          "commands": [
            {
              "name": "git clone",
              "content": "Clone a Git repository from a remote server."
            },
            {
              "name": "git status",
              "content": "Show the status of the working directory."
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

  static toJson() {
    List<Command> commands = [];
  }
}
