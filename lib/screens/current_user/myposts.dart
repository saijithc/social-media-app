import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/provider/provider.dart';

import 'package:socio/widgets/alertdialog.dart';

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
        context.watch<CurrentUserProvider>().MyDetails!.currentUserPosts.length;
    // context.watch<CurrentUserProvider>().POSTS.length;
    log("callig repeatedly");
    // return FutureBuilder(
    //   future: context.read<CurrentUserProvider>().getMyProfileDetai(),
    //   // initialData: InitialData,
    //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Consumer<CurrentUserProvider>(
      builder: (context, value, child) {
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: value.MyDetails!.currentUserPosts.length,
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
                      image: DecorationImage(
                          image: NetworkImage(
                              value.MyDetails!.currentUserPosts[index].image),
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
