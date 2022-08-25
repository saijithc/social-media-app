import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/Screens/theme/theme_mode.dart';

class SwitchScreen extends StatelessWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<ThemeChanger>(
            builder: (context, val, child) {
              return Switch(
                value: val.thememode == ThemeMode.dark,
                activeColor: Colors.blue,
                onChanged: (value) {
                  val.toggleTheme(value);
                },
              );
            },
          ),
        ]);
  }
}
