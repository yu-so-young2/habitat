import 'package:flutter/material.dart';

class RewardPanelWidget extends StatelessWidget {
  final ScrollController controller;

  const RewardPanelWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: const [
        SizedBox(
          height: 50,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "collection",
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Collectionitem(),
            Collectionitem(),
            Collectionitem(),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Collectionitem(),
            Collectionitem(),
            Collectionitem(),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Collectionitem(),
            Collectionitem(),
            Collectionitem(),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Collectionitem(),
            Collectionitem(),
            Collectionitem(),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Collectionitem(),
            Collectionitem(),
            Collectionitem(),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Collectionitem(),
            Collectionitem(),
            Collectionitem(),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class Collectionitem extends StatelessWidget {
  const Collectionitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              blurRadius: 5.0,
              spreadRadius: 0.0,
              offset: const Offset(0, 0),
            )
          ]),
      child: Image.asset("lib/assets/images/sunflower.png"),
    );
  }
}
