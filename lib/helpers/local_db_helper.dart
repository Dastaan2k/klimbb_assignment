import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/device_profile.dart';

class LocalDBHelper {

  static late Isar isar;


  static init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([DeviceProfileSchema], directory: dir.path);
  }


  static Future<DBResponse<List<DeviceProfile>>> getAllProfiles() async {
    try {
      return DBResponse(data: await isar.txn(() async => await isar.deviceProfiles.where().findAll()));
    }
    catch(e) {
      return DBResponse(error: true, status: 500, reasonPhrase: 'Unknown error occurred while fetching saved profiles');
    }
  }

  static Future<DBResponse<DeviceProfile>> getProfile(int id) async {
    try {
      var profile = (await isar.deviceProfiles.get(id));
      if(profile != null) {
        return DBResponse(data: profile);
      }
      else {
        return DBResponse(error: true, status: 404, reasonPhrase: 'Profile not found');
      }
    }
    catch(e) {
      return DBResponse(error: true, status: 500, reasonPhrase: 'Unknown error occurred while fetching profile : $e');
    }
  }

  static Future<DBResponse<DeviceProfile>> getProfileFromLatLng(double lat, double long) async {
    try {
      var profiles = (await isar.deviceProfiles.filter().latitudeEqualTo(lat).longitudeEqualTo(long).findAll());
      if(profiles.isNotEmpty) {
        return DBResponse(data: profiles.first);
      }
      else {
        return DBResponse(error: true, status: 404, reasonPhrase: 'Profile not found');
      }
    } catch(e) {
      return DBResponse(error: true, status: 500, reasonPhrase: 'Unknown error occurred while fetching profile : $e');
    }
  }


  static Future<DBResponse<DeviceProfile>> postProfile(DeviceProfile profile) async {
    try {
      if(await _prePostValidation(profile) == true) {
        await isar.writeTxn(() => isar.deviceProfiles.put(profile));
        return await getProfileFromLatLng(profile.latitude, profile.longitude);
      }
      else {
        return DBResponse(error: true, status: 409, reasonPhrase: 'Profile with identical settings already present');
      }
    }
    catch(e) {
      return DBResponse(error: true, status: 500, reasonPhrase: 'Unknown error occurred while creating profile');
    }
  }


  static Future<DBResponse<DeviceProfile>> updateProfile(DeviceProfile profile, {FlexScheme? theme, double? fontMultiplier}) async {
    try {
      if(await _prePostValidation(profile) == true) {
        var getResp = await getProfile(profile.id);
        if(getResp.error) {
          return getResp;
        }
        else {
          getResp.data!..theme = (theme ?? profile.theme)..fontSizeMultiplier = (fontMultiplier ?? profile.fontSizeMultiplier);
          await isar.writeTxn(() async =>  await isar.deviceProfiles.put(getResp.data!));
          return await getProfile(profile.id);
        }
      }
      else {
        return DBResponse(error: true, status: 409, reasonPhrase: 'Similar profile already present');
      }
    }
    catch(e) {
      return DBResponse(error: true, status: 500, reasonPhrase: 'Unknown error occurred while updating profile');
    }
  }


  static Future<bool> _prePostValidation(DeviceProfile profile) async {
    var profiles = (await isar.deviceProfiles.filter().themeEqualTo(profile.theme).fontSizeMultiplierEqualTo(profile.fontSizeMultiplier).findAll());
    return profiles.isEmpty;
  }

}



class DBResponse<T> {

  T? data;
  bool error;
  int status;
  String? reasonPhrase;

  DBResponse({this.data, this.status = 200, this.error = false, this.reasonPhrase});

}