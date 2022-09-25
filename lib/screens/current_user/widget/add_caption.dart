import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/add_post.dart';
import 'package:socio/screens/current_user/provider/provider.dart';
import 'package:socio/screens/theme/theme_mode.dart';

class AddCaption extends StatelessWidget {
  const AddCaption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: h * 0.3,
                width: w * 0.85,
                child: Consumer<ThemeChanger>(
                  builder: (context, value, child) {
                    return TextFormField(
                      controller:
                          context.read<CurrentUserProvider>().captionController,
                      style: TextStyle(
                        color: value.thememode == ThemeMode.dark
                            ? Colors.black
                            : Colors.white,
                      ),
                      maxLines: 8,
                      decoration: InputDecoration(
                          fillColor: value.thememode == ThemeMode.dark
                              ? Colors.white
                              : Colors.black,
                          hintText: "add caption",
                          filled: true,
                          hintStyle: TextStyle(
                            color: value.thememode == ThemeMode.dark
                                ? Colors.black
                                : Colors.white,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8))),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: w * 0.85,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.blue),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => const AddPost()));
                          },
                          child: const Text("Previous")),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: w * 0.85,
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {
                            context
                                .read<CurrentUserProvider>()
                                .uploadPost(context);
                          },
                          child: Consumer<CurrentUserProvider>(
                            builder: (context, value, child) {
                              return value.isLoading == true
                                  ? SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: const CircularProgressIndicator(
                                        color: Colors.white,
                                      ))
                                  : const Text("Done");
                            },
                          )),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
