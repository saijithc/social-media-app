import 'package:flutter/material.dart';
import 'package:socio/common/chooseimage.dart';
import 'package:socio/common/text.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.13,
      width: width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: width * 0.025,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    choose(context);
                  },
                  child: Container(
                    height: height * 0.1,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: height * 0.05,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                text1(
                  "New",
                  sizes: height * 0.015,
                  weight: FontWeight.w600,
                )
              ],
            ),
            SizedBox(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.1,
                            width: width * 0.2,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage("assets/Zayn.jpeg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          text1("Stories",
                              sizes: height * 0.015, weight: FontWeight.w600),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
