import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import '../widgets/color_scheme.dart';
import 'screens/new_timer.dart';

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    final win = appWindow;

    const initialSize = Size(570, 550);
    win.minSize = initialSize;
    win.size = initialSize;

    win.alignment = Alignment.center;
    win.title = "Theo Time";
    win.show();
  });
}

class MyApp extends StatelessWidget {
  //add theme change listener
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MyApp.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          //change theme according to light switch toggle
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Theo Time',
            theme: ThemeData(
              colorScheme: lightColorScheme,
              snackBarTheme: SnackBarThemeData(
                actionTextColor:
                    Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              snackBarTheme: SnackBarThemeData(
                actionTextColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            themeMode: currentMode,
            home: const SetTime(),
          );
        });
  }
}
/*
void main() {
  //minimumSize: Size(560, 550),
  //maximumSize: Size(565, 600),
  doWhenWindowReady(() {
    const initialSize = Size(560, 550);
    appWindow.maxSize = const Size(565, 600);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MyApp.themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            supportedLocales: const [Locale('en', 'US')],
            debugShowCheckedModeBanner: false,
            title: 'Theo Time',
            theme: ThemeData(
              colorScheme: lightColorScheme,
              snackBarTheme: SnackBarThemeData(
                actionTextColor:
                    Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            darkTheme: ThemeData(
              colorScheme: darkColorScheme,
              snackBarTheme: SnackBarThemeData(
                actionTextColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            themeMode: currentMode,
            home: const SetTime(),
          );
        });
  }
}
*/
