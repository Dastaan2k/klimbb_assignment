import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klimbb_assignment/helpers/shared_preferences_helper.dart';
import 'package:klimbb_assignment/models/device_profile.dart';

import '../helpers/local_db_helper.dart';


class AppState extends ChangeNotifier {

  bool dataLoaded = false;

  DeviceProfile? currentProfile;

  setCurrentProfile(DeviceProfile? profile, {bool shouldNotifyListeners = true}) {

    if(profile != null) {
      SharedPreferencesHelper.saveProfileId(profile.id);
    }
    else {
      SharedPreferencesHelper.clear();
    }
    currentProfile = profile;
    if(shouldNotifyListeners) {
      notifyListeners();
    }

  }


  loadInitialData() async {

    int? id = await SharedPreferencesHelper.getSavedProfileId();
    if(id != null) {
      DBResponse<DeviceProfile> resp = await LocalDBHelper.getProfile(id);
      if(resp.error) {
        if(resp.status == 404) {
          currentProfile = null;
        }
        else {
          Fluttertoast.showToast(msg: 'An error occurred');
        }
      }
      else {
        setCurrentProfile(resp.data!);
      }
    }
    dataLoaded = true;
    notifyListeners();

  }

}


