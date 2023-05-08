import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class CoasterController extends GetxController {
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  // 연결상태 저장용
  BluetoothDeviceState deviceState = BluetoothDeviceState.disconnected;

  RxString coasterStatus = '연결 대기중'.obs;
  RxString coasterData = '데이터 아무것도 없다'.obs;
  late BluetoothDevice device;

  void scanDevice() async {
    // 스캔 결과 초기화

    coasterStatus.value = '연결 중...';
    //스캔 시작 제한시간 5초
    await flutterBlue.startScan(timeout: const Duration(seconds: 5));
    // 스캔 결과 할당
    flutterBlue.scanResults.listen(
      (results) async {
        for (var element in results) {
          debugPrint("률루가 들어왔을까??? ${element.device.name}");
          if (element.device.name == '률류') {
            coasterStatus.value = '률류 연결!!!';
            device = element.device;
            await connectDevice();
            return;
          }
        }
        coasterStatus.value = '블루투스를 찾을 수 없습니다.';
      },
    );
  }

  connectDevice() async {
    bool returnValue = true;

    await device.connect(autoConnect: false).timeout(
      const Duration(milliseconds: 10000),
      onTimeout: () {
        returnValue = false;
        debugPrint("연결 실패 ㅠ.ㅠ");
      },
    ).then((data) async {
      if (returnValue) {
        List<BluetoothService> bleService = await device.discoverServices();

        for (BluetoothService service in bleService) {
          for (BluetoothCharacteristic c in service.characteristics) {
            await device.requestMtu(223);

            Map<String, List<int>> notifyDatas = {};

            if (!c.isNotifying) {
              try {
                await c.setNotifyValue(true);
                // 받을 데이터 변수 Map 형식으로 키 생성
                notifyDatas[c.uuid.toString()] = List.empty();

                // 데이터 읽기 처리!
                c.value.listen((value) {
                  debugPrint('받은 데이터 : ${c.uuid}: $value');

                  // 받은 데이터 저장 화면 표시용
                  notifyDatas[c.uuid.toString()] = value;

                  if (notifyDatas.containsKey(c.uuid.toString())) {
                    // notify 데이터가 존재한다면
                    if (notifyDatas[c.uuid.toString()]!.isNotEmpty) {
                      coasterData.value =
                          ascii.decode(notifyDatas[c.uuid.toString()]!);
                    }
                  }
                });
              } catch (e) {
                debugPrint('error ${c.uuid} $e');
              }
            }
          }
        }
      }
    });
  }
}
