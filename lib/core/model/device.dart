class Device {
  final String id;
  final String name;

  Device({required this.id, required this.name});

  String display() {
    return "$id $name";
  }
}

Device noDevice = Device(id: 'no device', name: 'no device');
