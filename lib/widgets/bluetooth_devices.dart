import 'package:flutter/material.dart';
import 'package:flutter_rust_bridge_template/ffi/ffi.dart';

class BluetoothDevices extends StatefulWidget {
  const BluetoothDevices({Key? key}) : super(key: key);

  @override
  _BluetoothDevicesState createState() => _BluetoothDevicesState();
}

class _BluetoothDevicesState extends State<BluetoothDevices> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          api.getDevices();
        },
        child: const Text('test'));
  }
}
