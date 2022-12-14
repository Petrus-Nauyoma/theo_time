import 'package:flutter/material.dart';
import 'package:theo_time/main.dart';

class LightSwitch extends StatelessWidget {
  const LightSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        tooltip: "Theme",
        icon: Icon(
          MyApp.themeNotifier.value == ThemeMode.light
              ? Icons.dark_mode
              : Icons.light_mode,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        onPressed: () {
          MyApp.themeNotifier.value =
              MyApp.themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
        });
  }
}
