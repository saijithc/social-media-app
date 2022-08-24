import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:socio/Screens/Bottom/bottom.dart';
import 'package:socio/Screens/login_activities/view/login.dart';
import 'package:socio/Screens/login_activities/view/widget/textform.dart';

import '../../../Widgets/text.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailConntroller = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white, // resizeToAvoidBottomInset: false,
        body: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
            child: ListView(children: [
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  height: height * 0.32,
                  width: width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/sayi (1).jpg"))),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Textform(
                        obscureText: false,
                        hint: "username",
                        controller: userNameController,
                        validator: (val) {
                          return val!.length >= 4
                              ? null
                              : "Username should contain atleast 4 characters";
                        },
                      ),
                      SizedBox(height: height * 0.01),
                      Textform(
                        obscureText: false,
                        hint: "fullname",
                        controller: fullNameController,
                        validator: (val) {
                          return val!.length >= 4
                              ? null
                              : "Fullname should contain atleast 4 characters";
                        },
                      ),
                      SizedBox(height: height * 0.01),
                      Textform(
                        obscureText: false,
                        hint: "Phone number",
                        controller: numberController,
                        validator: (val) {
                          return val!.length == 10
                              ? null
                              : "Please provide a valid Phone number";
                        },
                      ),
                      SizedBox(height: height * 0.01),
                      Textform(
                          obscureText: false,
                          hint: "email",
                          controller: emailConntroller,
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val!)
                                ? null
                                : "Please provide a valid email id";
                          }),
                      SizedBox(height: height * 0.01),
                      Textform(
                          obscureText: true,
                          hint: "password",
                          controller: passwordController,
                          validator: (val) {
                            return val!.length >= 6
                                ? null
                                : "Password should contain minimum 6 characters";
                          }),
                      SizedBox(height: height * 0.01),
                      Textform(
                        obscureText: true,
                        hint: "confirm password",
                        controller: confirmPasswordController,
                        validator: (val) {
                          return val!.length >= 6 &&
                                  passwordController.text ==
                                      confirmPasswordController.text
                              ? null
                              : "Please give the right password";
                        },
                      )
                    ],
                  ),
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
                      child: Center(
                          child: text1("Sign Up", weight: FontWeight.bold))),
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => const Bottom()));
                      passwordController.clear();
                      numberController.clear();
                      confirmPasswordController.clear();
                      fullNameController.clear();
                      userNameController.clear();
                      emailConntroller.clear();
                    }
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
                                color: Colors.black45, weight: FontWeight.bold),
                          ],
                        ))),
                    onTap: () {}),
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
                                            builder: (ctx) => Login()));
                                  },
                                text: "Login now",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold))
                          ]))
                    ])
              ])
            ])));
  }
}
