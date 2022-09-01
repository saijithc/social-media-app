import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/signup/model_class/model.dart';
import 'package:socio/screens/signup/provider/otp_provider.dart';
import 'package:socio/screens/signup/provider/provider.dart';
import 'package:socio/widgets/text.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/signup.jpg"),
                text1("Enter the OTP",
                    color: Colors.black, weight: FontWeight.w800, sizes: 18),
                const SizedBox(height: 30),
                SizedBox(
                  width: 250,
                  child: Consumer<OtpProvider>(
                    builder: (context, value, child) {
                      return PinCodeTextField(
                        autoDisposeControllers: false,
                        appContext: context,
                        length: 4,
                        obscureText: false,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          selectedFillColor:
                              const Color.fromARGB(62, 105, 225, 255),
                          inactiveFillColor: Colors.white,
                          // inactiveColor: Colors.amber,
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.green,
                        ),

                        animationDuration: const Duration(milliseconds: 300),
                        //backgroundColor: Colors.blue.shade50,
                        enableActiveFill: true,
                        // errorAnimationController: errorController,
                        controller: value.textEditingController,
                        onCompleted: (v) {
                          // print("Completed");
                        },
                        onChanged: (value) {
                          // print(value);

                          // currentText = value;
                        },
                        // beforeTextPaste: (text) {
                        //   // print("Allowing to paste $text");
                        //   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //   //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        //   return true;
                        // },
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 60, top: 15, bottom: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        context.read<SignupProvider>().validation(context);
                      },
                      child: text1("Resend OTP",
                          color: const Color.fromARGB(186, 68, 153, 223),
                          weight: FontWeight.w700),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<OtpProvider>().verification(
                        context,
                        user,
                        context
                            .read<OtpProvider>()
                            .textEditingController
                            .text
                            .trim());
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(209, 94, 197, 98)),
                  child: Consumer<OtpProvider>(
                    builder: (context, value, child) {
                      return value.loadining
                          ? const SizedBox(
                              height: 25,
                              // width: 25,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : text1("Verify", color: Colors.white);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
