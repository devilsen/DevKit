import 'package:devkit/core/provider/tool_room_model.dart';
import 'package:devkit/feature/home/terminal_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/data.dart';
import 'core/device_scanner.dart';
import 'core/model/kit.dart';
import 'core/provider/terminal_text_list_model.dart';
import 'feature/home/directory_page.dart';
import 'feature/home/tool_room_page.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ToolRoomModel()),
      ChangeNotifierProvider(create: (context) => TerminalTextListModel(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevKit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ToolRoomModel(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Kit? kit;

  @override
  void initState() {
    super.initState();
    print("Home init state");

    requestKit();
    DeviceScanner.getDevices();
  }

  void requestKit() async {
    Kit kit = await Data.getKit();
    setState(() {
      this.kit = kit;
    });
  }

  Widget loadingData() {
    if (kit == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Column(
        children: [
          Expanded(
            child: Row(
              children: [
                DirectoryPage(kit!.toolRoomList),
                Expanded(flex: 3, child: ToolRoomPage(kit!.toolRoomList[0]))
              ],
            ),
          ),
          const TerminalPage()
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.blueAccent,
        child: loadingData(),
      ),
    );
  }
}
