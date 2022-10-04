import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:socio/helperfunction/helper_function.dart';
import 'package:socio/screens/bottom/bottom.dart';
import 'package:socio/screens/current_user/model/current_user_details.dart';
import 'package:socio/screens/current_user/model/timeline_post_model.dart';
import 'package:socio/screens/suggestions/provider/suggestion_provider.dart';
import 'package:socio/services/addpost.dart';
import 'package:socio/services/current_user_details.dart';
import 'package:socio/services/delete_post.dart';
import 'package:socio/services/get_posts.dart';
import 'package:socio/widgets/custom_snackbar.dart';

class CurrentUserProvider with ChangeNotifier {
  double? tabViewheight;
  int pCount = 0;
  int tCount = 0;
  File? image;
  bool isLoading = false;
  UserDetails? MyDetails;
  // List<GetCurrentUserPostModel> MyDetails = [];
  List<GetPostModel> POSTS = [];
  final TextEditingController captionController = TextEditingController();
  setPMode(context) {
    setTabaviewHeight(context: context, childCount: pCount, crossAxisCount: 2);
  }

  setTMode(context) {
    setTabaviewHeight(context: context, childCount: tCount, crossAxisCount: 3);
  }

  setTabaviewHeight(
      {required BuildContext context,
      required int childCount,
      required int crossAxisCount}) {
    double tileHeight = MediaQuery.of(context).size.width / crossAxisCount;
    if (childCount == 0) return;
    if (childCount % 2 != 0) {
      childCount++;
    }
    tabViewheight = tileHeight * (childCount / crossAxisCount);
    log('$tabViewheight,$tileHeight');
    notifyListeners();
  }

  pickImageFromCamera(ImageSource source) async {
    try {
      XFile? pickedImage = await ImagePicker().pickImage(
          source: source, imageQuality: 80, maxHeight: 1080, maxWidth: 1080);
      if (pickedImage != null) {
        image = File(pickedImage.path);
        notifyListeners();
      }
      //  img = pickedImage!.name;

    } catch (e) {
      log(e.toString());
    }
  }

  uploadPost(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    log("uploadPost function called");
    final id = await HelperFuction.getUserid();
    final postDetails =
        PostDetails(caption: captionController.text, userId: id.toString());
    final postImage = PostImage(image: image!);
    log("this is userId" + postDetails.userId);
    log("this is the caption" + postDetails.caption.toString());
    PostServises().uploadImage(postDetails, postImage).then((value) {
      if (value == 'sucess') {
        captionController.clear();
        isLoading = false;
        getMyProfileDetai();
        notifyListeners();
        customSnackBar(context, "Post Created Successfully");

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const Bottom()));
        getMyProfileDetai();
      } else {
        isLoading = false;
        notifyListeners();
        log(value.toString());
        customSnackBar(context, value ?? 'something went wrong');
      }
    });
  }

  Future getPost(BuildContext context) async {
    POSTS = await GetPosts().GetTimelinePosts() ?? [];
    context.read<SuggestionProvider>().getSuggetions();
    notifyListeners();
  }

  Future getMyProfileDetai() async {
    log("details " + CurrentUserDetails().getUserDetails().toString());
    CurrentUserDetails().getUserDetails().then((value) {
      log("this is value" + value.toString());
      MyDetails = value;
      log("this is my details" + MyDetails.toString());
      notifyListeners();
    });
  }

  deletePost(BuildContext context, postId) {
    isLoading = true;
    notifyListeners();
    DeletePostApi().deletePost(postId).then((value) {
      if (value == "sucess") {
        isLoading = false;
        notifyListeners();
        customSnackBar(context, "Post Deleted sucessfully");
        getMyProfileDetai();
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => Bottom()));
      } else {
        isLoading = false;
        notifyListeners();
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => Bottom()));
        customSnackBar(context, value.toString());
      }
    });
  }
}
