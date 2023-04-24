import 'package:flutter/material.dart';

import 'widgets/pomodoro.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xFFE7626C),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
          displayLarge: TextStyle(
            color: Color(0xFF232B55),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      title: 'Navigation Basics',
      home: const Pomodoro(),
    ),
  );
}
