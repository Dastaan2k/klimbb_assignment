import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static Future<int> saveProfileId(int id) async {
    try {
      (await SharedPreferences.getInstance()).setInt('profile_id', id);
      return 0;
    }
    catch(e) {
      return 1;
    }
  }

  static Future<int?> getSavedProfileId() async {
    return (await SharedPreferences.getInstance()).getInt('profile_id');
  }

  static Future<void> clear() async {
    await (await SharedPreferences.getInstance()).clear();
  }

}