import 'dart:developer';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:socio/helperfunction/helper_function.dart';
import 'package:socio/screens/bottom/view/bottom.dart';
import 'package:socio/screens/current_user/model/current_user_details.dart';
import 'package:socio/screens/current_user/model/timeline_post_model.dart';
import 'package:socio/screens/suggestions/provider/suggestion_provider.dart';
import 'package:socio/services/addpost.dart';
import 'package:socio/services/current_user_details.dart';
import 'package:socio/services/delete_post.dart';
import 'package:socio/services/follow.dart';
import 'package:socio/services/get_posts.dart';
import 'package:socio/common/custom_snackbar.dart';
import 'package:image_cropper/image_cropper.dart';

class CurrentUserProvider with ChangeNotifier {
  double? tabViewheight;
  bool isFollowing = false;
  int pCount = 0;
  int tCount = 0;
  File? image;
  File? croppedImage;
  bool noNetwork = false;
  bool isLoading = false;
  bool loading = false;

  bool isPostLoading = false;
  UserDetails? MyDetails;
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

  pickImage(ImageSource source) async {
    try {
      XFile? pickedImage = await ImagePicker().pickImage(
          source: source, imageQuality: 80, maxHeight: 1080, maxWidth: 1080);
      if (pickedImage != null) {
        image = File(pickedImage.path);
        notifyListeners();
        cropImage(image!);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  cropImage(File pickedImage) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedImage.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio7x5,
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      croppedImage = File(croppedFile.path);
      notifyListeners();
    }
  }

  uploadPost(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    log("uploadPost function called");
    final id = await HelperFuction.getUserid();
    final postDetails =
        PostDetails(caption: captionController.text, userId: id.toString());
    final postImage = PostImage(image: croppedImage!);
    log("this is userId" + postDetails.userId);
    log("this is the caption" + postDetails.caption.toString());
    PostServises().uploadImage(postDetails, postImage).then((value) {
      if (value == 'sucess') {
        captionController.clear();
        isLoading = false;
        getMyProfileDetai();
        notifyListeners();
        customSnackBar(context, "Post Created Successfully");
        croppedImage = null;
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
    isPostLoading = true;
    notifyListeners();

    POSTS = await GetPosts().GetTimelinePosts() ?? [];
    context.read<SuggestionProvider>().getSuggetions();
    isPostLoading = false;
    notifyListeners();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      noNetwork = true;
      notifyListeners();
    }
  }

  Future followAndUnfollow(id) async {
    loading = true;
    notifyListeners();
    await FollowAndUnfollow().followAndUnfollow(id);
    getMyProfileDetai();
    loading = false;
    notifyListeners();
  }

  changeIsFollowingState() {
    isFollowing = !isFollowing;
    notifyListeners();
  }

  checkFollowed(id) {
    log("checkFollowed called");
    if (MyDetails!.following.contains(id)) {
      isFollowing = true;
    } else {
      isFollowing = false;
    }
    notifyListeners();
  }

  Future getMyProfileDetai() async {
    final id = await HelperFuction.getUserid();
    CurrentUserDetails().getUserDetails(id).then((value) {
      MyDetails = value;

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
        getMyProfileDetai();
        customSnackBar(context, "Post Deleted sucessfully");
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => Bottom()));
      } else {
        isLoading = false;
        notifyListeners();
        customSnackBar(context, value.toString());
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => Bottom()));
        customSnackBar(context, value.toString());
      }
    });
  }
}
