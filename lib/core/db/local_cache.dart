import 'dart:developer';
import 'package:app/core/keys/pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RecentPromptsCache {

  Future<List<String>> getRecentPromptsCache() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var recentPrompts = prefs.getStringList(
      PrefKeys.RECENT_PROMPTS, 
    );
    log("Fetched Recent Prompts !!!");
    return recentPrompts ?? [];
  }

  Future<void> setRecentPromptsCache(List<String> value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      PrefKeys.RECENT_PROMPTS, 
      value
    );
    log("Saved Recent Prompts !!!");
  }

}

class GeneratedImagesCache {

  Future<List<String>> getGeneratedImagesCache() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var generatedImages = prefs.getStringList(
      PrefKeys.GENERATED_IMAGES, 
    );
    log("Fetched Generated Images !!!");
    return generatedImages ?? [];
  }

  Future<void> setGeneratedImagesCache(List<String> value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      PrefKeys.GENERATED_IMAGES, 
      value
    );
    log("Saved Generated Images !!!");
  }

}