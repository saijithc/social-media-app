import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/provider/provider.dart';

import 'package:socio/common/alertdialog.dart';
import 'package:socio/common/text.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => context.read<CurrentUserProvider>().setPMode(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    log('PROFILE BUILDED');
    context.read<CurrentUserProvider>().pCount =
        context.watch<CurrentUserProvider>().MyDetails!.posts.length;
    log("callig repeatedly");
    return Consumer<CurrentUserProvider>(
      builder: (context, value, child) {
        return value.MyDetails!.posts.isEmpty
            ? Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(height: height * 0.1),
                    text1("No Post", sizes: 24, weight: FontWeight.bold),
                  ],
                ))
            : GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: value.MyDetails!.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return value.MyDetails == null
                      ? Center(child: const CircularProgressIndicator())
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              value.getMyProfileDetai();
                              value.getPost(context);
                              customAlert(context, value, index);
                            },
                            child: Container(
                              height: height * 0.1,
                              width: width * 0.1,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          value.MyDetails!.posts[index].image),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black),
                            ),
                          ),
                        );
                },
              );
      },
    );
  }
}
