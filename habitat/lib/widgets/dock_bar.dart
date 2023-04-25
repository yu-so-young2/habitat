import 'package:flutter/material.dart';

class DockBar extends StatefulWidget {
  const DockBar({super.key});

  @override
  State<DockBar> createState() => _DockBarState();
}

class _DockBarState extends State<DockBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DockBarTab(
            tabname: "report",
            tabicon: Icons.library_books_rounded,
          ),
          DockBarTab(
            tabname: "reward",
            tabicon: Icons.emoji_events_rounded,
          ),
          DockBarTab(
            tabname: "home",
            tabicon: Icons.home,
          ),
          DockBarTab(
            tabname: "social",
            tabicon: Icons.people_alt_rounded,
          ),
          DockBarTab(
            tabname: "setting",
            tabicon: Icons.settings,
          ),
        ],
      ),
    );
  }
}

class DockBarTab extends StatelessWidget {
  final String tabname;
  final IconData tabicon;

  const DockBarTab({
    super.key,
    required this.tabname,
    required this.tabicon,
  });

  void pressbutton() {}

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        fixedSize: const Size(60, 60),
        padding: const EdgeInsets.all(8),
        backgroundColor: Theme.of(context).primaryColor,
        shape: const RoundedRectangleBorder(
          side: BorderSide(style: BorderStyle.none),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      // boxShadow: const [
      //   BoxShadow(
      //     blurRadius: 30,
      //     blurStyle: BlurStyle.inner,
      //     color: Colors.black,
      //     offset: Offset(5, 5),
      //     spreadRadius: 0.1,
      //   )
      // ],
      child: Column(
        children: [
          Icon(tabicon),
          Text(tabname),
        ],
      ),
    );
  }
}
