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

  static Future<DBResponse<DeviceProfile>> getUser(double lat, double long) async {
    try {
      var users = (await isar.deviceProfiles.filter().latitudeEqualTo(lat).longitudeEqualTo(long).findAll());
      if(users.isNotEmpty) {
        return DBResponse(data: users.first);
      }
      else {
        return DBResponse(error: true, status: 404, reasonPhrase: 'Profile not found');
      }
    } catch(e) {
      return DBResponse(error: true, status: 500, reasonPhrase: 'Unknown error occurred while fetching profile');
    }
  }


  static Future<DBResponse<DeviceProfile>> postUser(DeviceProfile profile) async {
    try {
      if(await _prePostValidation(profile) == true) {
        await isar.writeTxn(() => isar.deviceProfiles.put(profile));
        return await getUser(profile.latitude, profile.longitude);
      }
      else {
        return DBResponse(error: true, status: 409, reasonPhrase: 'Similar profile already present');
      }
    }
    catch(e) {
      return DBResponse(error: true, status: 500, reasonPhrase: 'Unknown error occurred while creating profile');
    }
  }


  static Future<DBResponse<DeviceProfile>> updateUser(DeviceProfile profile, {FlexScheme? theme, double? fontMultiplier}) async {
    try {
      if(await _prePostValidation(profile) == true) {
        var getResp = await getUser(profile.latitude, profile.longitude);
        if(getResp.error) {
          return getResp;
        }
        else {
          getResp.data!..theme = (theme ?? profile.theme)..fontSizeMultiplier = (fontMultiplier ?? profile.fontSizeMultiplier);
          await isar.writeTxn(() async =>  await isar.deviceProfiles.put(getResp.data!));
          return await getUser(profile.latitude, profile.longitude);
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
    var profiles = (await isar.deviceProfiles.filter().latitudeEqualTo(profile.latitude).longitudeEqualTo(profile.longitude).themeEqualTo(profile.theme).fontSizeMultiplierEqualTo(profile.fontSizeMultiplier).findAll());
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