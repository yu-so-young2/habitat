import 'package:flutter/material.dart';
import 'package:habitat/screens/settingscreen/coaster_connect.dart';
import 'package:habitat/screens/settingscreen/setting_water.dart';
import 'package:habitat/widgets/dock_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Setting 설정",
          style: TextStyle(
            color: Color(0xff002B20),
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false, //뒤로가기 버튼 없애기
        // leading: IconButton(
        //   padding: EdgeInsets.zero,
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: const Icon(
        //     Icons.arrow_back_ios_rounded,
        //     size: 30,
        //     color: Colors.black,
        //   ),
        // ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                height: 100,
                // width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                      offset: const Offset(0, 0),
                    )
                  ],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Icon(
                        Icons.local_florist_rounded,
                        size: 68,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "쏘영쏘",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "목표 음수량 : 1.5L",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const settingbox(),

              // Bluetooth(),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const DockBar(),
    );
  }
}

class settingbox extends StatefulWidget {
  const settingbox({
    super.key,
  });

  @override
  State<settingbox> createState() => _settingboxState();
}

class _settingboxState extends State<settingbox> {
  onSettingWater() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SettingWater()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 50, bottom: 20),
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "목표설정",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CoasterConnect(),
                  ));
            },
            style: TextButton.styleFrom(
              // minimumSize: Size.zero,
              padding: const EdgeInsets.only(left: 10),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              "목표 음수량 설정",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          TextButton(
            onPressed: onSettingWater,
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xff47799B),
              padding: const EdgeInsets.only(left: 10),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              "목표 음수량 추천받기",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
