import 'package:flutter/material.dart';

class StatefulTest extends StatefulWidget {
  const StatefulTest({super.key});

  @override
  State<StatefulTest> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<StatefulTest> {
  int countup = 0;

  void onclicked() {
    setState(() {
      countup = countup += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Count Up",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
            Text(
              "$countup",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            IconButton(
                onPressed: onclicked, icon: const Icon(Icons.plus_one_rounded)),
          ],
        ),
      ),
    );
  }
}
