import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void goReport() {
    Navigator.pushNamed(context, '/report');
  }

  void goReward() {
    Navigator.pushNamed(context, '/reward');
  }

  void goSocial() {
    Navigator.pushNamed(context, '/social');
  }

  void goSetting() {
    Navigator.pushNamed(context, '/setting');
  }

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
                "main screen 서울 남산체",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: goReport,
                child: const Text(
                  "Report Page",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: goReward,
                child: const Text(
                  "Reward Page",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: goSocial,
                child: const Text(
                  "Social Page",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: goSetting,
                child: const Text(
                  "Setting Page",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
