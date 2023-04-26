import 'package:flutter/material.dart';
import 'package:habitat/widgets/dock_bar.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var amountwater = 75;

  void drinkup() {
    setState(() {
      amountwater = amountwater + 1;
      if (amountwater == 101) {
        amountwater = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF78C6F7), Colors.white],
              stops: [0, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
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
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 360,
                    width: 360,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        color: Colors.blue[600]),
                  ),
                  CircularStepProgressIndicator(
                    totalSteps: 100,
                    currentStep: amountwater,
                    stepSize: 35,
                    selectedColor: const Color(0xFF9CD2F7),
                    unselectedColor: const Color(0xFFDCE9FC),
                    padding: 0,
                    width: 400,
                    height: 400,
                    selectedStepSize: 35,
                    // roundedCap: (_, __) => false,
                  ),
                  Text(
                    "$amountwater %",
                    style: const TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                ),
                onPressed: drinkup,
                child: const Text(
                  "물 한잔 마시기",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        panelBuilder: () => const PanelWidget(),
      ),
      bottomNavigationBar: const DockBar(),
    );
  }
}

class PanelWidget extends StatelessWidget {
  const PanelWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: const [
        SizedBox(
          height: 36,
        ),
        Text("되나?되나?되나???????????????????"),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
