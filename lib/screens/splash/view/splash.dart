import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/helperfunction/helper_function.dart';
import 'package:socio/screens/splash/provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key, required this.isLogged}) : super(key: key);
  final bool isLogged;
  @override
  Widget build(BuildContext context) {
    log('splash called');
    HelperFuction.value++;
    log(HelperFuction.value.toString());
    final h = MediaQuery.of(context).size.height;
    context.read<SplashProvider>().gotoHome(context, isLogged);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            height: h * 0.06,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo.png"),
              ),
            ),
          ),
        ));
  }
}
