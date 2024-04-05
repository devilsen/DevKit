// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:devkit/core/device_scanner.dart';
import 'package:devkit/core/model/device.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('get devices test', () {
    const result0String = "List of devices attached\n\n";
    const result1String = "List of devices attached\nemulator-5554\tdevice\n\n";
    const result2String = "List of devices attached\nR28M808\tdevice\nemulator-5554\tdevice\n\n";

    var result0Device = DeviceScanner.resolvingDevices(result0String);
    expect([], result0Device);

    var result1Device = DeviceScanner.resolvingDevices(result1String);
    var result1 = [Device(id: 'emulator-5554', name: 'device')];
    expect(result1.toString(), result1Device.toString());

    var result2Device = DeviceScanner.resolvingDevices(result2String);
    var result2 = [Device(id: 'R28M808', name: 'device'), Device(id: 'emulator-5554', name: 'device')];
    expect(result2.toString(), result2Device.toString());
  });
}
