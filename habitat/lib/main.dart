import 'package:flutter/material.dart';
import 'package:habitat/screens/main_screen.dart';
import 'package:habitat/screens/report_screen.dart';
import 'package:habitat/screens/reward_screen.dart';
import 'package:habitat/screens/setting_screen.dart';
import 'package:habitat/screens/social_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: "habit@",
      theme: ThemeData(
        fontFamily: "SeoulNamsan",
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/report': (context) => const ReportScreen(),
        '/reward': (context) => const RewardScreen(),
        '/social': (context) => const SocialScreen(),
        '/setting': (context) => const SettingScreen(),
      },
    ),
  );
}
