import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/Screens/Bottom/Provider/bottom_provider.dart';
import 'package:socio/Screens/chats%20/chat.dart';
import 'package:socio/Screens/current_user/provider/theme_mode.dart';
import 'package:socio/Screens/home%20/home.dart';
import 'package:socio/Screens/likes/likes.dart';
import 'package:socio/Screens/current_user/profile.dart';
import 'package:socio/Screens/search/search.dart';

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
  // int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.1),
      resizeToAvoidBottomInset: false,
      body: pages[context.watch<BottomProvder>().currentIndex],
      bottomNavigationBar: Consumer<ThemeChanger>(
        builder: ((context, val, child) {
          return BottomNavigationBar(
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              selectedItemColor:
                  val.thememode == ThemeMode.dark ? Colors.white : Colors.black,
              unselectedItemColor: const Color.fromARGB(95, 15, 15, 15),
              currentIndex: context.watch<BottomProvder>().currentIndex,
              onTap: (newIndex) {
                context.read<BottomProvder>().update(newIndex);
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
                    // backgroundColor: Colors.white,
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
              ]);
        }),
      ),
    );
  }
}
