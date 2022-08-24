import 'package:flutter/material.dart';
import 'package:socio/Widgets/text.dart';

choose(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  //final width = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding:
              EdgeInsets.only(top: height * 0.4, bottom: height * 0.3),
          backgroundColor: Colors.white,
          content: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              text("Choose image", Colors.black, height * 0.025,
                  FontWeight.w800, 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.linked_camera_outlined,
                            color: Colors.black,
                          )),
                      text("Camera", Colors.black, height * 0.015,
                          FontWeight.bold, 1)
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.image_outlined,
                            color: Colors.black,
                          )),
                      text("Gallery", Colors.black, height * 0.015,
                          FontWeight.bold, 1)
                    ],
                  )
                ],
              )
            ],
          )),
        );
      });
}
