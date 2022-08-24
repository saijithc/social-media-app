import 'package:flutter/material.dart';

import 'package:socio/Widgets/alertdialog.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              customAlert(context);
            },
            child: Container(
              height: height * 0.1,
              width: width * 0.1,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("assets/music.jpeg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
