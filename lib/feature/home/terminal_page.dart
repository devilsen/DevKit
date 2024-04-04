import 'package:devkit/core/provider/terminal_text_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TerminalPage extends StatefulWidget {
  const TerminalPage({super.key});

  @override
  State<StatefulWidget> createState() => _TerminalPageState();
}

class _TerminalPageState extends State<TerminalPage> {
  final _scrollController = ScrollController();
  late Provider provider;

  @override
  Widget build(BuildContext context) {
    // final textList = Provider.of<TerminalTextListModel>(context, listen: true).textList;
    // print("textList: $textList");

    return Container(
        height: 200,
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Consumer<TerminalTextListModel>(builder: (context, model, child) {
          if (_scrollController.hasClients) {
            Future.delayed(const Duration(milliseconds: 100)).then((value) => _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease));
          }

          return ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: model.textList.length,
              itemBuilder: (BuildContext context, int index) {
                return Text("> ${model.textList[index]}");
              });
        }));
  }
}
