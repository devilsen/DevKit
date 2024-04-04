
class SettingItem {

  final String title;

  const SettingItem({required this.title});


  static List<SettingItem> getSettingItems() {
    return [
      // const SettingItem(title: '新增'),
      const SettingItem(title: '关于'),
    ];
  }
}