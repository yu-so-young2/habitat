import 'package:flutter/material.dart';
import 'package:habitat/widgets/dock_bar.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  transformAlignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "main screen",
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
            children: [
              Positioned(
                // top: 50,
                // left: 50,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: Colors.amber),
                ),
              ),
              Positioned(
                child: CircularStepProgressIndicator(
                  totalSteps: 100,
                  currentStep: 75,
                  stepSize: 15,
                  selectedColor: Colors.lightBlue,
                  unselectedColor: Colors.grey[200],
                  padding: 0,
                  width: 200,
                  height: 200,
                  selectedStepSize: 30,
                  roundedCap: (_, __) => true,
                ),
              ),
              const Positioned(
                top: 50,
                // bottom: 0,
                left: 50,
                // right: 0,
                child: Text("data"),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: const DockBar(),
    );
  }
}
