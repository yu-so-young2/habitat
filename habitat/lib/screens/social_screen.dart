import 'package:flutter/material.dart';
import 'package:habitat/widgets/dock_bar.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  State<SocialScreen> createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  onSubmitButton() {}
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text(
//           "Friends 친구",
//           style: TextStyle(
//               color: Color(0xff002B20),
//               fontSize: 28,
//               fontWeight: FontWeight.w600),
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 child: const Text('AB1234'),
//               ),
//               IconButton(onPressed: () {}, icon: const Icon(Icons.copy_rounded))
//             ],
//           ),
//           Row(
//             children: [
//               const TextField(
//                 decoration: InputDecoration(hintText: '친구 코드를 입력하세요.'),
//               ),
//               ElevatedButton(onPressed: onSubmitButton, child: const Text('확인'))
//             ],
//           )
//         ],
      // ),
      bottomNavigationBar: DockBar(),
    );
  }
}
