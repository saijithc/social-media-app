import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/Screens/Bottom/Provider/bottom_provider.dart';
import 'package:socio/Screens/login_activities/view/login.dart';
import 'package:socio/Screens/signup/provider/otp_provider.dart';
import 'package:socio/Screens/signup/view/otp.dart';
import 'package:socio/Screens/theme/theme_mode.dart';
import 'package:socio/Screens/theme/themes.dart';
import 'package:socio/Screens/login_activities/provider/provider.dart';
import 'package:socio/Screens/signup/provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => OtpProvider()),
        ChangeNotifierProvider(create: (_) => SignupProvider()),
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
      home: const OtpScreen(),
    );
  }
}
