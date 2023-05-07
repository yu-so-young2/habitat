import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class CoasterController extends GetxController {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  // 연결상태 저장용
  BluetoothDeviceState deviceState = BluetoothDeviceState.disconnected;
  bool isScanning = false;

  RxList scanResultList = [].obs;
  Map<String, List<int>> notifyDatas = {};

  void scanForDevices() async {
    // 스캔 결과 초기화
    scanResultList.clear();

    isScanning = true;
    //스캔 시작 제한시간 5초
    await flutterBlue.startScan(timeout: const Duration(seconds: 5));
    // 스캔 결과 할당
    flutterBlue.scanResults.listen(
      (results) {
        for (var element in results) {
          if (element.device.name != '') {
            if (scanResultList
                    .indexWhere((e) => e.device.id == element.device.id) <
                0) {
              scanResultList.add(element);
            }
          }
        }
      },
    );
    isScanning = false;
  }
}
