import 'package:flutter/material.dart';
import 'package:habitat/widgets/dock_bar.dart';

class SettingWater extends StatefulWidget {
  const SettingWater({super.key});

  @override
  State<SettingWater> createState() => _SettingWaterState();
}

class _SettingWaterState extends State<SettingWater> {
  final weatherList = ['고온다습', '고온건조', '저온다습', '저온건조'];
  var selectedWeatherValue;

  final activeList = ['활동량이 많음', '활동량 보통', '활동량 적음'];
  var selectedActiveValue;

  onSubmitButton() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Color(0xff002B20)),
        title: const Text(
          '목표 음수량 추천받기',
          style: TextStyle(color: Color(0xff002B20)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('체중'),
                Flexible(
                  child: TextField(),
                ),
                Flexible(child: Text('kg')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('기후'),
                DropdownButton(
                    value: selectedWeatherValue,
                    items: weatherList.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedWeatherValue = value;
                      });
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('활동량'),
                Flexible(
                    child: DropdownButton(
                        value: selectedActiveValue,
                        items: activeList.map(
                          (value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedActiveValue = value;
                          });
                        }))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff47799B)),
                    onPressed: onSubmitButton,
                    child: const Text('목표 음수량 추천받기'))
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const DockBar(),
    );
  }
}
