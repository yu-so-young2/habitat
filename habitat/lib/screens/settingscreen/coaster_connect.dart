import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class CoasterConnect extends StatefulWidget {
  const CoasterConnect({super.key});

  @override
  State<CoasterConnect> createState() => _CoasterConnectState();
}

class _CoasterConnectState extends State<CoasterConnect> {
  late BluetoothDevice _device;
  late BluetoothCharacteristic _characteristic;
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  List<ScanResult> scanResultList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            onPressed: _scanForDevices,
            child: const Text(
              "기기 검색",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "검색된 블루투스 리스트",
            style: TextStyle(color: Colors.black),
          ),
          Builder(builder: (context) {
            if (scanResultList.isEmpty) {
              return const Text(
                "없다",
                style: TextStyle(
                  color: Colors.black,
                ),
              );
            } else {
              return const Text(
                "있다",
                style: TextStyle(
                  color: Colors.black,
                ),
              );
            }
          }),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: scanResultList.length,
              itemBuilder: (context, index) {
                var devicename = scanResultList[index].device.name;
                if (devicename.isNotEmpty) {
                  return Text(
                    devicename,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  );
                } else {
                  return const Text(
                    "notting",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _scanForDevices() async {
    // Start scanning
    await flutterBlue.startScan(timeout: const Duration(seconds: 5));
    // Listen to scan results
    flutterBlue.scanResults.listen((results) {
      // do something with scan results
      setState(() {
        print(results);
        scanResultList = results;
      });
    });
  }

  void _stopForDevices() async {
    // Stop scanning
    flutterBlue.stopScan();
    print('stop scanning');
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
