import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/provider/provider.dart';
import 'package:socio/widgets/text.dart';

options(BuildContext context, postId) {
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
                Container(
                  height: height * 0.06,
                  width: width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white),
                  child: Center(
                    child: text("Edit", Colors.black, height * 0.02,
                        FontWeight.bold, 1),
                  ),
                ),
                SizedBox(height: height * 0.02),
                GestureDetector(
                  onTap: () => context
                      .read<CurrentUserProvider>()
                      .deletePost(context, postId),
                  child: Container(
                    height: height * 0.06,
                    width: width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Center(
                      child:
                          context.watch<CurrentUserProvider>().isLoading == true
                              ? const CircularProgressIndicator()
                              : text("Delete", Colors.black, height * 0.02,
                                  FontWeight.bold, 1),
                    ),
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
