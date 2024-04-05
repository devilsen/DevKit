import 'package:flutter/cupertino.dart';

import 'command_engine.dart';
import 'model/command.dart';
import 'model/device.dart';

class DeviceScanner {
  static final CommandEngine _commandEngine = CommandEngine();

  static Device selectedDevice = noDevice;

  static bool isConnectedDevice() {
    return selectedDevice != noDevice;
  }

  static Future<List<Device>> getDevices() async {
    var command = const Command(name: 'get devices', content: 'adb devices');
    return _commandEngine.execute(command).then((value) {
      print(value);
      var devices = resolvingDevices(value);
      if (devices.isNotEmpty) {
        if (selectedDevice == noDevice) {
          selectedDevice = devices[0];
        }
      } else {
        selectedDevice = noDevice;
      }
      return devices;
    });
  }

  @visibleForTesting
  static List<Device> resolvingDevices(String value) {
    final List<Device> devices = [];

    value.split('\n').forEach((element) {
      print(element);

      if (element.contains('device')) {
        var data = element.split('\t');
        if (data.length == 2) {
          devices.add(Device(id: data[0], name: data[1]));
        }
      }
    });
    return devices;
  }
}
