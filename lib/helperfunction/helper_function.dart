import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFuction with ChangeNotifier {
  static String sharedPreferenceUserLoggedInkey = "ISLOGGEDIN";
  static int value = 0;
  bool isLoggedIn = false;
  static Future<bool> saveUserLogged(bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool(sharedPreferenceUserLoggedInkey, isUserLoggedIn);
  }

  Future<bool?> getUserSignInSharedpreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    return preferences.getBool(sharedPreferenceUserLoggedInkey);
  }

  setCount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setInt("count", value);
  }

  getCount() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt("count");
  }
}
