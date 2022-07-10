import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:process_run/shell.dart';
import '../main.dart';
import '../widgets/info_sheet.dart';

class SetTime extends StatefulWidget {
  const SetTime({Key? key}) : super(key: key);

  @override
  State<SetTime> createState() => _SetTimeState();
}

class _SetTimeState extends State<SetTime> {
  var shell = Shell();
  late TextEditingController _timeController;

  String _valueSaved1 = '';

  int setTime = 0;

  @override
  void initState() {
    super.initState();
    _timeController = TextEditingController(text: DateTime.now().toString());
  }

  int _convertToMinutes(String valueTime) {
    DateTime dtNow = DateTime.now();
    DateTime dt = DateTime.parse(valueTime.toString());
    Duration difference = dt.difference(dtNow);
    int timeInMinutes = difference.inMinutes;
    return timeInMinutes;
  } //convert dateTime from user into minutes which is used to set the shutdown timer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 8,
              ),
              DateTimePicker(
                type: DateTimePickerType.dateTime,
                dateMask: 'dd MMM yyyy  :  HH mm',
                controller: _timeController,
                firstDate: DateTime(2022),
                lastDate: DateTime(2100),
                icon: const Icon(Icons.event),
                dateLabelText: 'Date',
                timeLabelText: "Hour",
                onChanged: ((val) =>
                    setState(() => setTime = _convertToMinutes(val))),
                validator: (val) {
                  return null;
                },
                onSaved: (val) => setState(() => _valueSaved1 = val ?? ''),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                ),
                onPressed: () async {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 3),
                      content: const Text('Shutting down now.'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: shutDownCancel,
                      ),
                    ),
                  );
                  await shutDownNow();
                },
                child: const Text(
                  'Set Time',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content:
                                const Text('Shutting down in one minute..'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: shutDownCancel,
                            ),
                          ),
                        );
                        await shell.run('''
          shutdown 1
          ''');
                      },
                      child: const Text(
                        '1 min',
                        style: TextStyle(fontSize: 18),
                      ),
                    ), //now

                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content: const Text('Shutting down in 5 minutes..'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: shutDownCancel,
                            ),
                          ),
                        );
                        await shell.run('''
          shutdown 5 --halt 1
          ''');
                      },
                      child: const Text(
                        '5 min ',
                        style: TextStyle(fontSize: 18),
                      ),
                    ), //1 minute

                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content:
                                const Text('Shutting down in 10 minutes..'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: shutDownCancel,
                            ),
                          ),
                        );
                        await shell.run('''
          shutdown 10 --halt 1
          ''');
                      },
                      child: const Text(
                        '10 min',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content:
                                const Text('Shutting down in 15 minutes..'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: shutDownCancel,
                            ),
                          ),
                        );
                        await shell.run('''
          shutdown 15 --halt 1
          ''');
                      },
                      child: const Text(
                        '15 min',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content:
                                const Text('Shutting down in 30 minutes..'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: shutDownCancel,
                            ),
                          ),
                        );
                        await shell.run('''
          shutdown 30 --halt 1
          ''');
                      },
                      child: const Text(
                        '30 min',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content:
                                const Text('Shutting down in 60 minutes..'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: shutDownCancel,
                            ),
                          ),
                        );
                        await shell.run('''
          shutdown 60 --halt 1
          '''); //run shell command to shutdown after 60 minutes
                      },
                      child: const Text(
                        '1 h',
                        style: TextStyle(fontSize: 18),
                      ),
                    ), //now

                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content: const Text('Shutting down in 2 hours.'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: shutDownCancel,
                            ),
                          ),
                        );
                        await shell.run('''
          shutdown 120 --halt 1
          ''');
                      },
                      child: const Text(
                        '2 h',
                        style: TextStyle(fontSize: 18),
                      ),
                    ), //1 minute

                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content: const Text('Shutting down in e hours.'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: shutDownCancel,
                            ),
                          ),
                        );
                        await shell.run('''
          shutdown 180 --halt 1
          ''');
                      },
                      child: const Text(
                        '3 h',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content: const Text('Shutting down in 6 hours.'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: shutDownCancel,
                            ),
                          ),
                        );
                        await shell.run('''
          shutdown 360 --halt 1
          ''');
                      },
                      child: const Text(
                        '6 h',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content: const Text('Shutting down in 12 hours.'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: shutDownCancel,
                            ),
                          ),
                        );
                        await shell.run('''
          shutdown 720 --halt 1
          ''');
                      },
                      child: const Text(
                        '12 h',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                      ),
                      onPressed: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 3),
                            content: const Text('Shutting down in 24 hours.'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: shutDownCancel,
                            ),
                          ),
                        );
                        await shell.run('''
          shutdown 1440 --halt 1
          ''');
                      },
                      child: const Text(
                        '24 h',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: const [
        Text('Developed by akillix.com'),
        SizedBox(
          width: 2,
        ),
        InfoSheet(),
        SizedBox(
          width: 2,
        ),
        LightSwitch(),
      ],
    );
  }

  Future<List<ProcessResult>> shutDownNow() async {
    return await shell.run('''
        shutdown $setTime --halt 1
        ''');
  } //shutsdown the computer after giving a minute to undo.

  void shutDownCancel() async {
    await shell.run('''
          shutdown -c
          ''');
  } //cancel the most recent shutdown command
}

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
