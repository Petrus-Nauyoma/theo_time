import 'package:flutter/material.dart';

class InfoSheet extends StatelessWidget {
  const InfoSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        tooltip: "Info",
        icon: Icon(
          Icons.info,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        onPressed: () {
          showModalBottomSheet<void>(
              backgroundColor: const Color(0xFF212121),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 500,
                    child: Wrap(
                      runSpacing: 16,
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(width: 180, 'assets/img/akillix.png'),
                            Image.asset(width: 120, 'assets/img/qrcode.png'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
