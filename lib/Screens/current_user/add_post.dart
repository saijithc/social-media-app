import 'package:flutter/material.dart';
import 'package:socio/Widgets/chooseimage.dart';
import 'package:socio/Widgets/text.dart';

addPost(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          // insetPadding: EdgeInsets.only(
          //   top: height * 0.15,
          // ),
          backgroundColor: Colors.black.withOpacity(0.3),
          content: SizedBox(
            height: height * .62,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text("Add Post", Colors.white, height * 0.02,
                        FontWeight.w800),
                    SizedBox(height: height * 0.02),
                    GestureDetector(
                      onTap: () {
                        choose(context);
                      },
                      child: Container(
                        height: height * 0.35,
                        width: width * 0.6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Center(
                          child: Icon(
                            Icons.add_circle_outline_rounded,
                            size: height * 0.1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "add caption",
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                  ],
                ),
              ),
              bottomNavigationBar: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: height * 0.06,
                    width: width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Center(
                      child: text("Discard", Colors.black, height * 0.02,
                          FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: height * 0.06,
                    width: width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Center(
                      child: text(
                          "Post", Colors.black, height * 0.02, FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
