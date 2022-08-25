import 'package:flutter/material.dart';
import 'package:socio/Screens/other_users/postview.dart';
import 'package:socio/Screens/other_users/stories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Stories(),
              ),
              Posts(),
            ],
          ),
        ),
      ),
    );
  }
}
