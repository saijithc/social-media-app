import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFuction with ChangeNotifier {
  static String sharedPreferenceUserLoggedInkey = "ISLOGGEDIN";
  bool isLoggedIn = false;
  static Future<bool> saveUserLogged(bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool(sharedPreferenceUserLoggedInkey, isUserLoggedIn);
  }

  Future<bool?> getUserSignInSharedpreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool(sharedPreferenceUserLoggedInkey);
  }
}
