import 'package:devkit/core/device_scanner.dart';
import 'package:devkit/core/model/device.dart';
import 'package:flutter/material.dart';

class DeviceMenuButton extends StatefulWidget {
  const DeviceMenuButton({super.key});

  @override
  State<StatefulWidget> createState() => _DeviceMenuButtonState();
}

class _DeviceMenuButtonState extends State<DeviceMenuButton> {
  List<Device> devices = [noDevice];
  var selectedDevice = DeviceScanner.selectedDevice;

  @override
  initState() {
    super.initState();
    DeviceScanner.getDevices().then((value) {
      setState(() {
        devices = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Device>(
        icon: Text(
          selectedDevice.id,
        ),
        onSelected: (device) {
          print(device);

          setState(() {
            DeviceScanner.selectedDevice = device;
            selectedDevice = device;
          });
        },
        onOpened: () {
          print('onOpened');
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Device>>[
              for (final item in devices) PopupMenuItem<Device>(value: item, child: Text(item.display()))
            ]);
  }
}
