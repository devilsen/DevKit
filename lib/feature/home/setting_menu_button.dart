import 'package:devkit/core/model/setting_item.dart';
import 'package:flutter/material.dart';

class SettingMenuButton extends StatelessWidget {
  SettingMenuButton({super.key});

  final List<SettingItem> settingItems = SettingItem.getSettingItems();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SettingItem>(
        icon: const Icon(
          Icons.settings,
          color: Colors.black,
        ),
        onSelected: (settingItems) {
          print(settingItems.title);
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<SettingItem>>[
              for (final item in settingItems) PopupMenuItem<SettingItem>(value: item, child: Text(item.title))
            ]);
  }
}
