import 'package:flutter/material.dart';

class MainPanelWidget extends StatelessWidget {
  final ScrollController controller;

  const MainPanelWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      controller: controller,
      children: const [
        SizedBox(
          height: 50,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "water log",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
        waterlog(),
      ],
    );
  }
}

class waterlog extends StatelessWidget {
  const waterlog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.water_drop_rounded,
            size: 30,
            color: Colors.lightBlue,
          ),
          Text("물 300 ml 섭취!!"),
          Text("수정하기"),
        ],
      ),
    );
  }
}
