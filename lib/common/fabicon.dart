import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/provider/provider.dart';

import '../screens/current_user/view/add_post.dart';
import '../screens/current_user/view/settings.dart';

class FabiconButton extends StatelessWidget {
  const FabiconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(
        ringColor: Colors.black.withOpacity(.4),
        fabOpenIcon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        fabCloseIcon: Icon(
          Icons.close,
          color: Colors.white,
        ),
        alignment: Alignment.bottomCenter,
        //fabMargin: EdgeInsets.all(12),
        fabSize: 45,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add_circle_outline_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                context.read<CurrentUserProvider>().image = null;
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => const AddPost()));
                // print('Favorite');
              }),
          IconButton(
              icon: Icon(
                Icons.edit_note_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                print('Favorite');
              }),
          IconButton(
              icon: Icon(
                Icons.bookmark_border,
                color: Colors.white,
              ),
              onPressed: () {
                print('Favorite');
              }),
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const Settings()));
              })
        ]);
  }
}
