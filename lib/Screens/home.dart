import 'package:flutter/material.dart';
import 'package:socio/Screens/highlights.dart';
import 'package:socio/Screens/postview.dart';
import 'package:socio/Screens/stories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
