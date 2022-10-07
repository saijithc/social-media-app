import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/provider/provider.dart';
import 'package:socio/screens/other_users/post_card.dart';
import 'package:socio/screens/suggestions/view/suggestions.dart';
import '../suggestions/provider/suggestion_provider.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: context.read<CurrentUserProvider>().getPost(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Consumer<CurrentUserProvider>(
          builder: (context, value, child) {
            log("post count = " + value.POSTS.length.toString());
            return value.noNetwork == true
                ? Padding(
                    padding: EdgeInsets.only(top: height * .6 / 3),
                    child: const Text("Check your internet connection"),
                  )
                :
                // value.isPostLoading == true
                //     ? Column(
                //         children: [
                //           SizedBox(
                //             height: height * .6 / 2,
                //           ),
                //           // CircularProgressIndicator(),
                //         ],
                //       )
                //     :
                value.POSTS.length == 0
                    ? Padding(
                        padding: EdgeInsets.only(top: height * .6 / 3),
                        child: SizedBox(
                            height: height * 0.2,
                            width: width,
                            child: ShowSuggestions()),
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: value.POSTS.length,
                        itemBuilder: (BuildContext context, int index) {
                          return value.POSTS.length ~/ 2 == index
                              ? SizedBox(
                                  child: Column(
                                  children: [
                                    PostContainer(
                                      height: height,
                                      width: width,
                                      post: value.POSTS[index],
                                    ),
                                    Consumer<SuggestionProvider>(
                                      builder: (context, value, child) {
                                        return value.suggestions.length != 0
                                            ? SizedBox(
                                                height: height * 0.2,
                                                width: width,
                                                child: ShowSuggestions())
                                            : SizedBox();
                                      },
                                    ),
                                  ],
                                ))
                              : PostContainer(
                                  height: height,
                                  width: width,
                                  post: value.POSTS[index],
                                );
                        },
                      );
          },
        );
      },
    );
  }
}
