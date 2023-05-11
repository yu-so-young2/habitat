import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginBridge extends StatefulWidget {
  const LoginBridge({Key? key}) : super(key: key);

  @override
  State<LoginBridge> createState() => _LoginBridgeState();
}

class _LoginBridgeState extends State<LoginBridge> {
  static const storage = FlutterSecureStorage();

  String readOnboarding = '';
  String userInfo = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      asyncMethod();
    });

    Timer(const Duration(seconds: 3), () {
      if (readOnboarding == 'none') {
        Navigator.pushNamed(context, '/main');
      } else if (userInfo == 'none') {
        Navigator.pushNamed(context, '/login');
      } else {
        Navigator.pushNamed(context, '/main');
      }
    });
  }

  asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러온다. 불러오는 결과의 타입은 String
    readOnboarding = await storage.read(key: "onboarding") ?? 'none';
    userInfo = await storage.read(key: "userInfo") ?? 'none';
    debugPrint('앱을 처음 켰는지 여부 : $readOnboarding');
    debugPrint('로그인 정보가 있는지 여부 : $userInfo');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'laoding...',
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
    // return Builder(
    //   builder: (BuildContext context) {
    //     if (readOnboarding == 'none') {
    //       return const MainScreen();
    //     } else if (userInfo == 'none') {
    //       return const LoginScreen();
    //     } else {
    //       return const MainScreen();
    // return Center(
    //   child: Column(children: [
    //     Text("${snapshot.data?.displayName ?? 'anon'}님 환영합니다."),
    //   ]),
    // );
    //     }
    //   },
    // );
  }
}
