import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class Bluetooth extends StatefulWidget {
  const Bluetooth({super.key});

  @override
  State<Bluetooth> createState() => _BluetoothState();
}

class _BluetoothState extends State<Bluetooth> {
  late BluetoothDevice _device;
  late BluetoothCharacteristic _characteristic;
  bool _isConnected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _scanForDevices,
            child: const Text('Scan for devices'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _connectToDevice,
            child: const Text('Connect to device'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _sendData,
            child: const Text('Send data'),
          ),
        ],
      ),
    );
  }

  void _scanForDevices() async {
    // Scan for Bluetooth LE devices
    List<BluetoothDevice> devices = await FlutterBluePlus.instance
        .startScan(timeout: const Duration(seconds: 5));

    // Print the name and ID of each device found
    for (BluetoothDevice device in devices) {
      print('Found device: ${device.name} (${device.id})');
    }
  }

  void _connectToDevice() async {
    try {
      // Connect to the selected device
      await _device.connect();

      // Discover the services and characteristics of the device
      List<BluetoothService> services = await _device.discoverServices();

      for (BluetoothService service in services) {
        List<BluetoothCharacteristic> characteristics = service.characteristics;
        for (BluetoothCharacteristic characteristic in characteristics) {
          if (characteristic.uuid.toString() ==
              "00002a00-0000-1000-8000-00805f9b34fb") {
            // This is the characteristic we want to use for data transfer
            _characteristic = characteristic;
          }
        }
      }

      setState(() {
        _isConnected = true;
      });

      print('Connected to device');
    } catch (e) {
      print('Error connecting to device: $e');
    }
  }

  void _sendData() async {
    try {
      // Encode the data as bytes
      String data = "Hello from Flutter!";
      List<int> bytes = utf8.encode(data);

      // Send the data to the characteristic
      await _characteristic.write(bytes);

      print('Data sent: $data');
    } catch (e) {
      print('Error sending data: $e');
    }
  }
}
