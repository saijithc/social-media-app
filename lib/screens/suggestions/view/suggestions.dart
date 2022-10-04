import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/suggestions/provider/suggestion_provider.dart';
import 'package:socio/services/follow.dart';
import 'package:socio/widgets/text.dart';

class ShowSuggestions extends StatelessWidget {
  const ShowSuggestions({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Consumer<SuggestionProvider>(builder: (context, value, child) {
      return ListView.builder(
        itemCount: value.suggestions.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 214, 85, 46),
                    Color.fromARGB(255, 240, 150, 16)
                  ])),
              // color: Colors.amber,
              height: h * 0.1,
              width: w * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      radius: 30,
                      child: Image.network(
                        value.suggestions[index].avatar,
                        fit: BoxFit.cover,
                      )),
                  text1(value.suggestions[index].fullname,
                      weight: FontWeight.bold),
                  ElevatedButton(
                      onPressed: () {
                        FollowAndUnfollow()
                            .followAndUnfollow(value.suggestions[index].id);
                      },
                      child: text1("Follow"))
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
