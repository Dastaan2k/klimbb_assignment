import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:isar/isar.dart';

part 'device_profile.g.dart';


@collection
class DeviceProfile {

  Id id = Isar.autoIncrement;
  final String name;
  final double latitude;
  final double longitude;
  @enumerated
  FlexScheme theme;
  double fontSizeMultiplier;

  DeviceProfile({required this.name, required this.latitude, required this.longitude, required this.theme, required this.fontSizeMultiplier});

  DeviceProfile copyWith({String? name, double? latitude, double? longitude, FlexScheme? theme, double? fontSizeMultiplier}) {
    return DeviceProfile(name: name ?? this.name, latitude: latitude ?? this.latitude, longitude: longitude ?? this.longitude, theme: theme ?? this.theme, fontSizeMultiplier: fontSizeMultiplier ?? this.fontSizeMultiplier);
  }

}