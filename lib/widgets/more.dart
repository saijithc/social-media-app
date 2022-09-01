import 'package:flutter/material.dart';
import 'package:socio/widgets/text.dart';

more(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding:
              EdgeInsets.only(top: height * 0.25, bottom: height * 0.3),
          backgroundColor: Colors.white.withOpacity(0.2),
          content: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.06,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Center(
                    child: text("Follow", Colors.black, height * 0.02,
                        FontWeight.bold, 1),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.06,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Center(
                    child: text("Save", Colors.black, height * 0.02,
                        FontWeight.bold, 1),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.06,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Center(
                    child: text("Share", Colors.black, height * 0.02,
                        FontWeight.bold, 1),
                  ),
                )
              ],
            ),
          ),
        );
      });
}