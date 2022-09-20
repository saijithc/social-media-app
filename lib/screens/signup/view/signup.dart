import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/google/provider/provider.dart';
import 'package:socio/screens/login_activities/view/login.dart';
import 'package:socio/screens/login_activities/view/widget/textform.dart';
import 'package:socio/screens/signup/provider/provider.dart';
import '../../../widgets/text.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overScroll) {
                overScroll.disallowIndicator();
                return true;
              },
              child: ListView(children: [
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
                    height: height * 0.25,
                    width: width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/logo.png"))),
                  ),
                  Consumer<SignupProvider>(
                    builder: (context, value, child) {
                      return Form(
                        key: value.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: height * 0.02,
                            ),
                            CustomTextform(
                              obscureText: false,
                              hint: "username",
                              controller: value.userNameController,
                              validator: (val) {
                                return val!.length >= 4
                                    ? null
                                    : "Username should contain atleast 4 characters";
                              },
                            ),
                            SizedBox(height: height * 0.01),
                            CustomTextform(
                              obscureText: false,
                              hint: "fullname",
                              controller: value.fullNameController,
                              validator: (val) {
                                return val!.length >= 4
                                    ? null
                                    : "Fullname should contain atleast 4 characters";
                              },
                            ),
                            SizedBox(height: height * 0.01),
                            CustomTextform(
                              type: TextInputType.number,
                              obscureText: false,
                              hint: "Phone number",
                              controller: value.numberController,
                              validator: (val) {
                                return val!.length == 10
                                    ? null
                                    : "Please provide a valid Phone number";
                              },
                            ),
                            SizedBox(height: height * 0.01),
                            CustomTextform(
                                obscureText: false,
                                hint: "email",
                                controller: value.emailConntroller,
                                validator: (val) {
                                  return RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(val!)
                                      ? null
                                      : "Please provide a valid email id";
                                }),
                            SizedBox(height: height * 0.01),
                            CustomTextform(
                                icon: IconButton(
                                    splashColor: Colors.blue.withOpacity(0.5),
                                    splashRadius: 24,
                                    onPressed: () {
                                      value.checkVisibility();
                                    },
                                    icon: Icon(value.visibility
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined)),
                                obscureText: value.visibility,
                                hint: "password",
                                controller: value.passwordController,
                                validator: (val) {
                                  return val!.length >= 8
                                      ? null
                                      : "Password should contain minimum 6 characters";
                                }),
                            SizedBox(height: height * 0.01),
                            CustomTextform(
                              obscureText: value.visibility,
                              hint: "confirm password",
                              controller: value.confirmPasswordController,
                              validator: (val) {
                                return val!.length >= 8 &&
                                        value.passwordController.text ==
                                            value.confirmPasswordController.text
                                    ? null
                                    : "Please give the right password";
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  InkWell(
                    child: Container(
                        height: height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Colors.blue.withOpacity(0.5)),
                        width: width,
                        child: Center(child: Consumer<SignupProvider>(
                          builder: (context, value, child) {
                            return value.loadining
                                ? const SizedBox(
                                    height: 25,
                                    // width: 25,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : text1("Sign Up", weight: FontWeight.bold);
                          },
                        ))),
                    onTap: () {
                      context.read<SignupProvider>().validation(context);
                    },
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  InkWell(
                      child: Container(
                          height: height * 0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: const Color.fromARGB(255, 247, 247, 247)),
                          width: width,
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/google-icon.png"),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              text1("Sign Up with Google",
                                  color: Colors.black45,
                                  weight: FontWeight.bold),
                            ],
                          ))),
                      onTap: () {
                        context.read<GoogleProvider>().signIn(context, 1);
                      }),
                  SizedBox(height: height * 0.02),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "already have account? ",
                                style: const TextStyle(color: Colors.black),
                                children: <TextSpan>[
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (ctx) => const Login()));
                                    },
                                  text: "Login now",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold))
                            ]))
                      ])
                ])
              ]),
            )));
  }
}
