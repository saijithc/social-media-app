import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/chats%20/view/chatroom.dart';

import '../../widgets/text.dart';
import '../theme/theme_mode.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  color: const Color.fromARGB(189, 186, 185, 185),
                  height: height * 0.07,
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
            SizedBox(
              height: height * 0.01,
            ),
            Expanded(
              child: Consumer<ThemeChanger>(
                builder: (context, value, child) {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: 50,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) => ChatRoom())));
                          },
                          leading: Container(
                            height: height * 0.065,
                            width: width * 0.15,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("assets/Zayn.jpeg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          title: text1(
                            "Zayn_malik",
                            sizes: height * 0.02,
                            weight: FontWeight.w800,
                          ),
                          subtitle: text1("Last seen"),
                          trailing: Container(
                            height: height * 0.03,
                            width: width * 0.08,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(149, 225, 26, 175),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: text("2", Colors.white, height * 0.015,
                                  FontWeight.w600, 1),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            //SizedBox(height: height * 0.75, child: searchList())
          ],
        ),
      ),
    );
  }
}
