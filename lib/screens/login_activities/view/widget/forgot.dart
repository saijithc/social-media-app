import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/common/text.dart';
import '../../provider/provider.dart';
import 'textform.dart';

class Forgot extends StatelessWidget {
  const Forgot({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.4),
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            text1("Forgot password",
                sizes: 25, weight: FontWeight.bold, color: Colors.black),
            const SizedBox(height: 20),
            text1("Enter your email", color: Colors.black),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<LoginProvider>(
                builder: (context, value, child) {
                  return Form(
                    key: value.forgotkey,
                    child: CustomTextform(
                        validator: (value) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!)
                              ? null
                              : "Please provide a valid email id";
                        },
                        hint: 'email',
                        controller: value.forgotEmailController,
                        obscureText: false),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      onPressed: () {
                        context.read<LoginProvider>().forgot(context);
                      },
                      child: Consumer<LoginProvider>(
                        builder: (context, value, child) {
                          return value.progress
                              ? const Center(
                                  child: SizedBox(
                                    height: 25,
                                    child: CircularProgressIndicator(
                                        color: Colors.white),
                                  ),
                                )
                              : text1('Next', color: Colors.white);
                        },
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
