import 'package:flutter/material.dart';
import 'package:habitat/widgets/dock_bar.dart';

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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "main screen",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Text(
            "서울 남산체",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w600,
            ),
          ),
          Stack(
            children: [
              Positioned(
                bottom: 60,
                child: Container(
                  width: 300,
                  height: 200,
                  color: Colors.amber,
                ),
              ),
              Image.asset(
                "lib/assets/images/glass.png",
                width: 400,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
      bottomNavigationBar: const DockBar(),
    );
  }
}
