import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'feature/model/ToolBox.dart';
import 'feature/model/command.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevKit',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.blueAccent,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryPage(),
              Expanded(flex: 3, child: CategoryContentPage())
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CategoryTitle(),
          Expanded(child: CategoryListView()),
        ],
      ),
    );
  }
}

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) => ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Item $index'),
          onTap: () {
            print('Item $index tapped');
          },
        );
      });
}

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({super.key});

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

class CategoryContentPage extends StatelessWidget {
  const CategoryContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        children: [
          ContentTitle(title: '开发'),
          Expanded(child: ContentListView()),
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

class ContentListView extends StatefulWidget {
  const ContentListView({super.key});

  static const List<ToolBox> toolBoxList = [
    ToolBox(
      title: 'Flutter',
      commands: [
        Command(
          name: 'flutter',
          content: 'flutter content',
        ),
        Command(
          name: 'flutter1',
          content: 'flutter content1',
        ),
      ],
    ),
    ToolBox(
      title: 'Dart',
      commands: [
        Command(
          name: 'dart',
          content: 'dart content',
        ),
        Command(
          name: 'dart1',
          content: 'dart content1',
        ),
        Command(
          name: 'dart2',
          content: 'dart content2',
        ),
      ],
    ),
  ];

  @override
  State<StatefulWidget> createState() => _ContentListViewState();
}

class _ContentListViewState extends State<ContentListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ContentListView.toolBoxList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: ContentItem(ContentListView.toolBoxList[index]),
        );
      },
    );
  }
}

class ContentItem extends StatelessWidget {
  const ContentItem(this.toolBox, {super.key});

  final ToolBox toolBox;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 48,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(toolBox.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              )),
        ],
      ),
    );
  }
}
