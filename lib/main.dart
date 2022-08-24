import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/Screens/Bottom/Provider/bottom_provider.dart';
import 'package:socio/Screens/Bottom/bottom.dart';
import 'package:socio/Screens/current_user/provider/theme_mode.dart';
import 'package:socio/Screens/current_user/provider/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomProvder()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],
      child: const MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<ThemeChanger>().thememode,
      home: const Bottom(),
    );
  }
}
