import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/model/tool_room.dart';
import '../../core/provider/tool_room_model.dart';

class DirectoryPage extends StatelessWidget {
  final List<ToolRoom> toolRoomList;

  const DirectoryPage(this.toolRoomList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const DirectoryTitle(),
          Expanded(child: CategoryListView(toolRoomList)),
        ],
      ),
    );
  }
}

class DirectoryTitle extends StatelessWidget {
  const DirectoryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('分组',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              )),
          Icon(
            Icons.settings,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

class CategoryListView extends StatelessWidget {
  final List<ToolRoom> toolRoomList;

  const CategoryListView(this.toolRoomList, {super.key});

  @override
  Widget build(BuildContext context) {
    if (toolRoomList.isEmpty) {
      return const Center(
        child: Text('No data'),
      );
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ToolRoomModel>(context, listen: false).updateSelectedToolRoom(toolRoomList[0]);
    });

    return ListView.builder(
        itemCount: toolRoomList.length,
        itemBuilder: (BuildContext context, int index) {
          final toolRoom = toolRoomList[index];
          return ListTile(
            title: Text(toolRoom.name),
            onTap: () {
              Provider.of<ToolRoomModel>(context, listen: false).updateSelectedToolRoom(toolRoom);
            },
          );
        });
  }
}
