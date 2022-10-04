import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/provider/provider.dart';
import 'package:socio/screens/other_users/postview.dart';
import 'package:socio/screens/other_users/stories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () => context.read<CurrentUserProvider>().getPost(context),
          child: SingleChildScrollView(
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
      ),
    );
  }
}
