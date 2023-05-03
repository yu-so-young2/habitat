import 'package:flutter/material.dart';
import 'package:habitat/api/drinklog/api_drinklogs.dart';

class WaterLogInputModal extends StatefulWidget {
  const WaterLogInputModal({super.key});

  @override
  State<WaterLogInputModal> createState() => _WaterLogInputModalState();
}

class _WaterLogInputModalState extends State<WaterLogInputModal> {
  final drinkTypeList = ['water', 'coffee', 'non-coffee'];
  var selectedDrinkTypeValue = 'water';
  var drinkType = 'w';

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.blue),
      ),
      onPressed: () {
        _showdialog(context);
      },
      child: const Text(
        "나와라 모달!!!!!!!!!!!!!",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<dynamic> _showdialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setter) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DropdownButton(
                          value: selectedDrinkTypeValue,
                          items: drinkTypeList.map(
                            (value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            setter(() {
                              selectedDrinkTypeValue = value!;
                              if (selectedDrinkTypeValue == 'coffee') {
                                drinkType = 'c';
                              } else if (selectedDrinkTypeValue ==
                                  'non-coffee') {
                                drinkType = 'd';
                              } else {
                                drinkType = 'w';
                              }
                            });
                          }),
                      const Text("을(를) "),
                      const SizedBox(width: 40, child: TextField()),
                      const Text('만큼 마셨습니다!'),
                    ],
                  ),
                  const SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      ApiDrinkLogs().postAddDrinkLog(100, drinkType, 'asdf');
                      Navigator.pop(context);
                    },
                    child: const Text('전송'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
