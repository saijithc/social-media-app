import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/login_activities/provider/provider.dart';
import 'package:socio/screens/login_activities/view/login.dart';
import 'package:socio/widgets/text.dart';

sucess(context, message) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          // backgroundColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          insetPadding:
              EdgeInsets.only(top: height * 0.25, bottom: height * 0.3),
          content: Container(
            height: height * 0.3,
            width: width * 0.2,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const Icon(
                //   Icons.mark_email_unread_outlined,
                //   color: Colors.red,
                //   size: 50,
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 8, right: 8, bottom: 15),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => const Login()));
                      context
                          .read<LoginProvider>()
                          .forgotEmailController
                          .clear();
                    },
                    child: text1('OK'))
              ],
            ),
          ),
        );
      });
}
