import 'package:flutter/material.dart';
import 'package:socio/Screens/chat.dart';
import 'package:socio/Screens/home.dart';
import 'package:socio/Screens/likes.dart';
import 'package:socio/Screens/profile.dart';
import 'package:socio/Screens/search.dart';

class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  final List pages = [
    const HomeScreen(),
    ChatScreen(),
    SearchScreen(),
    const Likes(),
    const ProfileScreen()
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      resizeToAvoidBottomInset: false,
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: Colors.amber,
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color.fromARGB(96, 14, 14, 14),
          currentIndex: _currentIndex,
          onTap: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items: [
            const BottomNavigationBarItem(
                //backgroundColor: Colors.white,
                icon: Icon(Icons.home),
                label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline),
                //backgroundColor: Colors.white,
                label: 'Chats'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search),
                backgroundColor: Colors.white,
                label: 'Search'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                //  backgroundColor: Colors.white,
                label: 'likes'),
            BottomNavigationBarItem(
                icon: Stack(children: [
                  const Icon(Icons.person),
                  Positioned(
                      child: CircleAvatar(
                    radius: height * 0.022,
                    backgroundImage: const AssetImage(
                      "assets/me.jpg",
                    ),
                  ))
                ]),
                // backgroundColor: Colors.white,
                label: 'Profile')
          ]),
    );
  }
}
