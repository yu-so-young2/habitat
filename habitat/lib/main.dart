import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:habitat/screens/coaster/coaster_connect_screen.dart';
import 'package:habitat/screens/loading/loading_screen.dart';
import 'package:habitat/screens/main/main_screen.dart';
// import 'package:habitat/screens/login/login_bridge.dart';
import 'package:habitat/screens/reward/reward_screen.dart';
import 'package:habitat/screens/report/report_screen.dart';
import 'package:habitat/screens/settingscreen/setting_screen.dart';
import 'package:habitat/screens/social/social_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // final WebSocketChannel channel =
  //     IOWebSocketChannel.connect('ws://k8a704.p.ssafy.io:8081/websocket/asdf');

  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: "habit@",
      theme: ThemeData(
        fontFamily: "SeoulNamsan",
        primaryColor: const Color(0xFF78C6F7),
        scaffoldBackgroundColor: const Color(0xFFA1EF7A),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/report': (context) => const ReportScreen(),
        '/reward': (context) => const RewardScreen(),
        '/social': (context) => const SocialScreen(),
        '/setting': (context) => const SettingScreen(),
        '/loading': (context) => const LoadingScreen(),
        '/bluetooth': (context) => CoasterConnectScreen(),
      },
    ),
  );
}
