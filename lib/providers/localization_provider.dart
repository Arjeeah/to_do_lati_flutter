import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationProvider with ChangeNotifier {
  String lang = "en";

  setLang(String lan) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("language", lan).toString();
    getLang();
    notifyListeners();
  }

  getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lang = prefs.getString("language") ?? "en";
    notifyListeners();
  }
}
