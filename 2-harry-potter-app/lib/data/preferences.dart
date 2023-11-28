import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences extends ChangeNotifier {
  SharedPreferences? _preferences;

  bool showSubtitles = false;

  Preferences() {
    init();
  }

  init() async {
    _preferences = await SharedPreferences.getInstance();
    showSubtitles = _preferences?.getBool('show_subtitles') ?? false;

    notifyListeners();
  }

  Future<void> setShowSubtitles(bool value) async {
    _preferences ??= await SharedPreferences.getInstance();
    _preferences!.setBool('show_subtitles', value);
    showSubtitles = value;

    notifyListeners();
  }
}
