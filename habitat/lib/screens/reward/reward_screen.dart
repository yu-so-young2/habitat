import 'package:flutter/material.dart';
import 'package:habitat/screens/reward/reward_panelwidget.dart';
import 'package:habitat/widgets/dock_bar.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({
    super.key,
  });

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  final ScrollController scrollController = ScrollController();
  final PanelController panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        minHeight: 50,
        maxHeight: 400,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(36)),
        controller: panelController,
        scrollController: scrollController,
        collapsed: const Align(
          alignment: Alignment.topCenter,
          child: Icon(
            Icons.keyboard_double_arrow_up_rounded,
            size: 25,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFA1EF7A), Colors.white],
              stops: [0, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 72,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      transformAlignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD0F4BA),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "목표를 달성해서 꽃을 키워보자!!",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.water_drop_rounded,
                      size: 60,
                      color: Colors.lightBlue,
                    )
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green[600],
                    ),
                  ),
                  const CircularStepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 75,
                    stepSize: 20,
                    selectedColor: Color(0xFFBAF19C),
                    unselectedColor: Color(0xFFEAF8DA),
                    padding: 0,
                    width: 200,
                    height: 200,
                    selectedStepSize: 20,
                    // roundedCap: (_, __) => false,
                  ),
                  Image.asset(
                    'lib/assets/images/sunflower.png',
                    scale: 1.5,
                  ),
                  // const Positioned(
                  //   bottom: 20,
                  //   child: Text(
                  //     "꽃 사진",
                  //     style: TextStyle(
                  //       fontSize: 12,
                  //       fontWeight: FontWeight.w600,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // )
                ],
              ),
              Container(
                width: 260,
                height: 120,
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.symmetric(vertical: 30),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: const Offset(0, 0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(24)),
                child: Column(
                  children: [
                    const Text(
                      "행복한 해바라기",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "“당신을 사랑합니다.”",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: Colors.grey[400]),
                    ),
                    Text(
                      "획득레벨 : 어려움",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 2.5,
                          color: Colors.grey[400]),
                    ),
                    Text(
                      "획득조건 : 목표량 연속달성 10일",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[400]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        panelBuilder: () => RewardPanelWidget(
          controller: scrollController,
        ),
      ),
      bottomNavigationBar: const DockBar(),
    );
  }
}
