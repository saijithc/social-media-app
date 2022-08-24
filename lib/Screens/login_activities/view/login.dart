import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:socio/Screens/Bottom/bottom.dart';
import 'package:socio/Screens/login_activities/view/signup.dart';
import 'package:socio/Screens/login_activities/view/widget/textform.dart';
import '../../../Widgets/text.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                      key: formKey,
                      child: Column(children: [
                        Container(
                          height: height * 0.4,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/sayi (1).jpg"))),
                        ),
                        Textform(
                          obscureText: false,
                          type: TextInputType.number,
                          hint: "Phone number",
                          controller: numberController,
                          validator: (value) {
                            return value!.length == 10
                                ? null
                                : "Please provide a valid Phone number";
                          },
                        ),
                        SizedBox(height: height * 0.02),
                        Textform(
                            obscureText: true,
                            hint: "Password",
                            controller: passwordController,
                            validator: (val) {
                              return val!.length >= 6
                                  ? null
                                  : "Password should contain minimum 6 characters";
                            })
                      ])),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      text("Forgot password ?", Colors.blue, height * 0.015,
                          FontWeight.w600, 1)
                    ],
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
                            child: text1('Sign In', weight: FontWeight.bold))),
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const Bottom()));
                        passwordController.clear();
                        numberController.clear();
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
                            color: const Color.fromARGB(255, 243, 243, 243)),
                        width: width,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/google-icon.png"),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            text1("Sign In with Google",
                                color: Colors.black45, weight: FontWeight.bold),
                          ],
                        ))),
                    onTap: () {},
                  ),
                  SizedBox(height: height * 0.05),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: "Don't have account? ",
                              style: const TextStyle(color: Colors.black),
                              children: <TextSpan>[
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (ctx) => SignUp()));
                                  },
                                text: "Register now",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold))
                          ]))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
