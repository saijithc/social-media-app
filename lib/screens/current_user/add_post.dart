import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/bottom/bottom.dart';
import 'package:socio/screens/current_user/profile.dart';
import 'package:socio/screens/current_user/provider/provider.dart';
import 'package:socio/screens/current_user/widget/add_caption.dart';
import 'package:socio/screens/theme/theme_mode.dart';
import 'package:socio/widgets/chooseimage.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => const Bottom()));
            },
            icon: const Icon(Icons.close_rounded)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: h * 1 / 7,
              ),
              Consumer<ThemeChanger>(
                builder: (context, value, child) {
                  return Column(
                    children: [
                      Container(
                        height: h * 0.5,
                        width: w * 0.85,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  context.watch<CurrentUserProvider>().image ==
                                          null
                                      ? const AssetImage(
                                          "assets/avatar.png",
                                        )
                                      : Image.file(context
                                              .read<CurrentUserProvider>()
                                              .image!)
                                          .image,
                              fit: BoxFit.cover),
                          color: value.thememode == ThemeMode.dark
                              ? Colors.white
                              : Colors.black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: w * 0.85,
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.blue),
                            onPressed: () {
                              choose(context);
                            },
                            child: context.watch<CurrentUserProvider>().image ==
                                    null
                                ? const Text("Add image")
                                : const Text('Add another')),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: w * 0.85,
                        child: context.watch<CurrentUserProvider>().image ==
                                null
                            ? const Text('')
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => const AddCaption()));
                                },
                                child: const Text("Next")),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import '../../widgets/chooseimage.dart';
// import '../../widgets/text.dart';

// addPost(BuildContext context) {
//   final height = MediaQuery.of(context).size.height;
//   final width = MediaQuery.of(context).size.width;
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.zero,
//           backgroundColor: Colors.black.withOpacity(0.3),
//           content: SizedBox(
//             height: height * .62,
//             child: Scaffold(
//               backgroundColor: Colors.transparent,
//               body: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     text("Add Post", Colors.white, height * 0.02,
//                         FontWeight.w800, 1),
//                     SizedBox(height: height * 0.02),
//                     GestureDetector(
//                       onTap: () {
//                         choose(context);
//                       },
//                       child: Container(
//                         height: height * 0.35,
//                         width: width * 0.6,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(30),
//                             color: Colors.white),
//                         child: Center(
//                           child: Icon(
//                             Icons.add_circle_outline_rounded,
//                             size: height * 0.1,
//                             color: Colors.black,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextField(
//                         style: const TextStyle(color: Colors.black),
//                         decoration: InputDecoration(
//                             hintText: "add caption",
//                             fillColor: Colors.white,
//                             filled: true,
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30))),
//                       ),
//                     ),
//                     SizedBox(height: height * 0.02),
//                   ],
//                 ),
//               ),
//               bottomNavigationBar: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     height: height * 0.06,
//                     width: width * 0.25,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: Colors.white),
//                     child: Center(
//                       child: text("Discard", Colors.black, height * 0.02,
//                           FontWeight.bold, 1),
//                     ),
//                   ),
//                   Container(
//                     height: height * 0.06,
//                     width: width * 0.25,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: Colors.white),
//                     child: Center(
//                       child: text("Post", Colors.black, height * 0.02,
//                           FontWeight.bold, 1),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       });
// }
