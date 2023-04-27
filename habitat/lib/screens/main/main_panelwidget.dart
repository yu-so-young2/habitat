import 'package:flutter/material.dart';

class MainPanelWidget extends StatelessWidget {
  const MainPanelWidget({
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
        Text("슬라이딩 업 판넬", textAlign: TextAlign.center),
        SizedBox(
          height: 48,
        ),
        Text("이얏 호우!"),
      ],
    );
  }
}
