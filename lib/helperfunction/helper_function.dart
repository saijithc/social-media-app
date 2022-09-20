import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFuction with ChangeNotifier {
  static String sharedPreferenceUserLoggedInkey = "ISLOGGEDIN";
  static String accesstoken = "TOKEN";
  static String userId = "ID";
  static int value = 0;

  bool isLoggedIn = false;
  static Future<bool> saveUserLogged(bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool(sharedPreferenceUserLoggedInkey, isUserLoggedIn);
  }

  // static saveToken(
  //   String token,
  // ) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.setString(accesstoken, token);
  // }

  static saveUser(String id, String token) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(userId, id);
    preferences.setString(accesstoken, token);
  }

  static getUserid() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final value = preferences.getString(userId);
    log(value.toString());
    return value;
  }

  static deleteToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final value = preferences.getString(accesstoken);
    return value;
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
