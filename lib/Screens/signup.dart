import 'package:flutter/material.dart';
import 'package:socio/Screens/bottom.dart';
import 'package:socio/Screens/login.dart';
import 'package:socio/Screens/profile.dart';

import '../Widgets/text.dart';
import '../Widgets/textform.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final TextEditingController numberController = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: height * 0.2,
                    ),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        validator: (val) {
                          return val!.length == 10
                              ? null
                              : "please provide a valid Phone number";
                        },
                        controller: numberController,
                        style: simpleTextFieldStyle(Colors.white),
                        decoration: textFieldInputDecoration("Phone number")),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.center,
                        validator: (val) {
                          return val!.length >= 4
                              ? null
                              : "username should contain atleast 4 characters";
                        },
                        controller: userNameController,
                        style: simpleTextFieldStyle(Colors.white),
                        decoration: textFieldInputDecoration("username")),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.center,
                        validator: (val) {
                          return val!.length >= 4
                              ? null
                              : "fullname should contain atleast 4 characters";
                        },
                        controller: fullNameController,
                        style: simpleTextFieldStyle(Colors.white),
                        decoration: textFieldInputDecoration("fullname")),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        validator: (val) {
                          return val!.length >= 6
                              ? null
                              : "Password should contain minimum 6 characters";
                        },
                        controller: passwordController,
                        style: simpleTextFieldStyle(Colors.white),
                        decoration: textFieldInputDecoration("password")),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                        textAlign: TextAlign.center,
                        obscureText: true,
                        validator: (val) {
                          return val!.length >= 6 &&
                                  passwordController.text ==
                                      confirmPasswordController.text
                              ? null
                              : "Please give the right password";
                        },
                        controller: confirmPasswordController,
                        style: simpleTextFieldStyle(Colors.white),
                        decoration:
                            textFieldInputDecoration("confirm password")),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              InkWell(
                child: Container(
                    height: height * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.blue.withOpacity(0.5)),
                    width: width,
                    child: Center(
                        child: text(
                      "Sign Up",
                      Colors.white,
                      height * 0.02,
                      FontWeight.w600,
                    ))),
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => const Bottom()));
                    passwordController.clear();
                    numberController.clear();
                    confirmPasswordController.clear();
                    fullNameController.clear();
                    userNameController.clear();
                  }
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              InkWell(
                child: Container(
                    height: height * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.white),
                    width: width,
                    child: Center(
                        child: text(
                            "Sign Up with Google",
                            const Color.fromARGB(255, 126, 125, 125),
                            height * 0.02,
                            FontWeight.w500))),
                onTap: () {},
              ),
              SizedBox(height: height * 0.05),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text("already have account?", Colors.black, height * 0.02,
                      FontWeight.w300),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  InkWell(
                    child: text("Login now", Colors.blue, height * 0.02,
                        FontWeight.w700),
                    onTap: () {
                      // widget.toggle();
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) => Login()));
                    },
                  )
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
