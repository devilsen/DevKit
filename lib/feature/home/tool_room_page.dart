import 'package:flutter/material.dart';

import '../../core/command_engine.dart';
import '../../core/model/command.dart';
import '../../core/model/tool_box.dart';
import '../../core/model/tool_room.dart';


class ToolRoomPage extends StatelessWidget {
  final ToolRoom toolRoom;

  const ToolRoomPage(this.toolRoom, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ContentTitle(title: toolRoom.name),
          Expanded(child: ToolBoxListView(toolRoom.toolBoxList)),
        ],
      ),
    );
  }
}

class ContentTitle extends StatefulWidget {
  const ContentTitle({super.key, required this.title});

  final String title;

  @override
  State<ContentTitle> createState() => _ContentTitleState();
}

class _ContentTitleState extends State<ContentTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 15, 10, 15),
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              )),
          const Icon(
            Icons.add,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

class ToolBoxListView extends StatefulWidget {
  final List<ToolBox> toolBoxList;

  const ToolBoxListView(this.toolBoxList, {super.key});

  @override
  State<StatefulWidget> createState() => _ToolBoxListViewState();
}

class _ToolBoxListViewState extends State<ToolBoxListView> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.toolBoxList.length,
      itemBuilder: (BuildContext context, int index) {
        return ToolBoxItem(widget.toolBoxList[index]);
      },
    );
  }
}

class ToolBoxItem extends StatelessWidget {
  const ToolBoxItem(this.toolBox, {super.key});

  final ToolBox toolBox;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Text(toolBox.title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                )),
          ),
          CommandGridView(toolBox.commands),
        ],
      ),
    );
  }
}

class CommandGridView extends StatefulWidget {
  final List<Command> commands;

  const CommandGridView(this.commands, {super.key});

  @override
  State<StatefulWidget> createState() => _CommandGridViewState();
}

class _CommandGridViewState extends State<CommandGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.commands.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 3.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (BuildContext context, int index) {
          return CommandItem(widget.commands[index]);
        });
  }
}

class CommandItem extends StatefulWidget {
  const CommandItem(this.command, {super.key});

  final Command command;

  @override
  State<StatefulWidget> createState() => _CommandItemState();
}

class _CommandItemState extends State<CommandItem> {
  Color _color = Colors.white;
  final CommandEngine _commandEngine = CommandEngine();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(widget.command.content);
        _commandEngine.execute(widget.command);
      },
      onHover: (value) {
        if (value) {
          setState(() {
            _color = Colors.blueGrey.shade50;
          });
        } else {
          setState(() {
            _color = Colors.white;
          });
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blueAccent, width: 1.5),
        ),
        child: Text(widget.command.name),
      ),
    );
  }
}
