import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
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
    // final h = MediaQuery.of(context).size.height;
    context.read<SplashProvider>().gotoHome(context, isLogged);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: TextLiquidFill(
            loadDuration: Duration(seconds: 3),
            text: 'TAILUS',
            waveColor: Colors.white
            // Color.fromARGB(255, 68, 255, 255)
            ,
            // boxBackgroundColor: Colors.redAccent,
            textStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 80.0,
              fontWeight: FontWeight.bold,
            ),
            boxHeight: 300.0,
          ),
        ));
  }
}
