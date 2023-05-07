import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WaterController extends GetxController {
  var time = DateFormat('YY/MM/dd').format(DateTime.now()).toString();
  RxInt water = 0.obs;
  RxInt goal = 1400.obs;

  // 내부 저장소 접근
  static const storage = FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    getStorageData();
  }

  drinkwater(int drink) {
    water.value += drink;
    storage.write(key: 'water', value: water.string);
  }

  getStorageData() async {
    var storageTime = await storage.read(key: 'time');
    var storageWater = await storage.read(key: 'water');

    if (time == storageTime) {
      if (storageWater != null) {
        water.value = int.parse(storageWater);
      }
    } else {
      storage.write(key: 'time', value: time);
    }
  }
}
