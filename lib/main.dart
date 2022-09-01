import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socio/helperfunction/helper_function.dart';
import 'package:socio/screens/bottom/bottom.dart';
import 'package:socio/screens/current_user/provider/provider.dart';
import 'package:socio/screens/login_activities/view/login.dart';
import 'package:socio/screens/other_users/provider/provider.dart';
import 'package:socio/screens/theme/themes.dart';

import 'screens/bottom/Provider/bottom_provider.dart';
import 'screens/login_activities/provider/provider.dart';
import 'screens/signup/provider/otp_provider.dart';
import 'screens/signup/provider/provider.dart';
import 'screens/theme/theme_mode.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  bool islOGIN = prefs.getBool('ISLOGGEDIN') ?? false;
  runApp(MyApp(islOGIN));
}

class MyApp extends StatelessWidget {
  const MyApp(this.isLogged, {Key? key}) : super(key: key);
  final bool isLogged;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_) => OtpProvider()),
      ChangeNotifierProvider(create: (_) => SignupProvider()),
      ChangeNotifierProvider(create: (_) => BottomProvder()),
      ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ChangeNotifierProvider(create: (_) => HelperFuction()),
      ChangeNotifierProvider(create: (_) => CurrentUserProvider()),
      ChangeNotifierProvider(create: (_) => FollowersProvider()),
    ], child: ThemedApp(isLogged: isLogged));
  }
}

class ThemedApp extends StatelessWidget {
  const ThemedApp({
    Key? key,
    required this.isLogged,
  }) : super(key: key);

  final bool isLogged;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<ThemeChanger>().thememode,
      home: isLogged ? const Bottom() : const Login(),
    );
  }
}
