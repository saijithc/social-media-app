import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: Color.fromARGB(189, 186, 185, 185),
                  height: height * 0.075,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: height * 0.005),
                            child: Center(
                              child: TextField(
                                  onChanged: (value) {
                                    // initiateSearch();
                                  },
                                  controller: searchController,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            // initiateSearch();
                                          },
                                          icon: const Icon(
                                            Icons.search,
                                            color: Colors.white,
                                            size: 30,
                                          )),
                                      hintText: "search ",
                                      hintStyle:
                                          const TextStyle(color: Colors.black),
                                      border: InputBorder.none)),
                            ),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //SizedBox(height: height * 0.75, child: searchList())
          ],
        ),
      ),
    );
  }
}
