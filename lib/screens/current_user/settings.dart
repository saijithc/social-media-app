import 'package:flutter/material.dart';
import 'package:socio/helperfunction/helper_function.dart';
import 'package:socio/screens/current_user/widget/switch.dart';
import 'package:socio/screens/login_activities/view/login.dart';
import 'package:socio/widgets/text.dart';

import '../../widgets/buttons.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Colors.white,
        title: text1("Settings", weight: FontWeight.w800),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(
              Icons.info_outline_rounded,
            ),
            title: text1("About", weight: FontWeight.w800),
          ),
          ListTile(
            leading: const Icon(
              Icons.color_lens_outlined,
              // color: Colors.black,
            ),
            title: text1("Theme", weight: FontWeight.w800),
            trailing: const SwitchScreen(),
          ),
          ListTile(
            leading: const Icon(
              Icons.power_settings_new_sharp,
            ),
            title: text1("Log Out", weight: FontWeight.w800),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // backgroundColor: Colors.white,
                      contentPadding: EdgeInsets.zero,
                      insetPadding: EdgeInsets.only(
                          top: height * 0.25, bottom: height * 0.3),
                      content: Container(
                        height: height * 0.3,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 15, left: 8, right: 8, bottom: 15),
                              child: Text(
                                "Do you want to log out your account ?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w800),
                              ),
                            ),
                            SizedBox(height: height * 0.08),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: buttons(
                                      height * 0.06,
                                      width * 0.2,
                                      height * 0.03,
                                      "No",
                                      const Color.fromARGB(255, 112, 112, 112),
                                      Colors.white,
                                      height * 0.015,
                                      FontWeight.w500),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    HelperFuction.saveUserLogged(false);
                                    Navigator.pop(context);
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (ctx) => const Login()),
                                        (route) => false);
                                  },
                                  child: buttons(
                                      height * 0.06,
                                      width * 0.2,
                                      height * 0.03,
                                      "Logout",
                                      const Color.fromARGB(255, 112, 112, 112),
                                      Colors.white,
                                      height * 0.015,
                                      FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
