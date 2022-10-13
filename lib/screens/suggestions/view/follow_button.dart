import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socio/screens/current_user/provider/provider.dart';
import '../../../common/text.dart';

class FollowButton extends StatefulWidget {
  FollowButton({Key? key, required this.details}) : super(key: key);
  final String details;

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentUserProvider>(
      builder: (context, value, child) {
        return SizedBox(
          width: 100,
          height: 40,
          child: loading == true
              ? ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Center(
                      child: SizedBox(
                          height: 10,
                          width: 10,
                          child: const CircularProgressIndicator())))
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {
                    if (loading == false) {
                      loading = true;
                      value
                          .followAndUnfollow(widget.details)
                          .whenComplete(() => loading = false);
                    }
                    if (value.MyDetails!.following.contains(widget.details)) {
                      value.MyDetails!.following.remove(widget.details);
                    } else {
                      value.MyDetails!.following.add(widget.details);
                    }
                    setState(() {});
                  },
                  child: value.MyDetails!.following.contains(widget.details)
                      ? text1("Following", color: Colors.black)
                      : text1("Follow", color: Colors.black)),
        );
      },
    );
  }
}
