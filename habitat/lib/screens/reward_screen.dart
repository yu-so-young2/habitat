import 'package:flutter/material.dart';
import 'package:habitat/widgets/dock_bar.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({super.key});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "reward screen",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          CircularStepProgressIndicator(
            totalSteps: 100,
            currentStep: 75,
            stepSize: 10,
            selectedColor: Colors.greenAccent,
            unselectedColor: Colors.grey[200],
            padding: 0,
            width: 150,
            height: 150,
            selectedStepSize: 15,
            roundedCap: (_, __) => true,
          ),
        ],
      ),
      bottomNavigationBar: const DockBar(),
    );
  }
}
