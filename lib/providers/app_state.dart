import 'package:flutter/cupertino.dart';
import 'package:klimbb_assignment/models/device_profile.dart';

class AppState extends ChangeNotifier {

  DeviceProfile? deviceProfile;

  setDeviceProfile(DeviceProfile? profile) {
    deviceProfile = profile;
    notifyListeners();
  }

}