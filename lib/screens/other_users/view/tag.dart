import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/other_users/provider/provider.dart';

class FollowersTagScreen extends StatelessWidget {
  const FollowersTagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    log('tAG BUILDED');
    context.read<FollowersProvider>().tCount = 11;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 11,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              //TODO:
              //customAlert(context);
            },
            child: Container(
              height: height * 0.1,
              width: width * 0.1,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("assets/_.png"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
