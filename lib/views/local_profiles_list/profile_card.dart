import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:klimbb_assignment/models/device_profile.dart';
import 'package:klimbb_assignment/providers/app_state.dart';
import 'package:provider/provider.dart';

import '../../utils/globals.dart';

class ProfileCard extends StatelessWidget {

  final DeviceProfile profile;

  const ProfileCard({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: KGlobals.defaultSpacing, vertical: KGlobals.defaultSpacing * 0.5),
      elevation: 3,
      color: profile.id == Provider.of<AppState>(context).currentProfile!.id ? Theme.of(context).secondaryHeaderColor : Theme.of(context).cardColor,
      child: ListTile(
        onTap: () {
          Provider.of<AppState>(context, listen: false).setCurrentProfile(profile);
        },
        title: Text(profile.name, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: (Theme.of(context).textTheme.bodyLarge!.fontSize!) * (Provider.of<AppState>(context).currentProfile?.fontSizeMultiplier ?? 1), fontWeight: FontWeight.w500)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Theme : ${profile.theme.name}',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: (Theme.of(context).textTheme.bodyMedium!.fontSize)! * (Provider.of<AppState>(context).currentProfile?.fontSizeMultiplier ?? 1))),
            Text('Font size multiplier : ${profile.fontSizeMultiplier} x', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: (Theme.of(context).textTheme.bodyMedium!.fontSize)! * (Provider.of<AppState>(context).currentProfile?.fontSizeMultiplier ?? 1))),
            Text('Coordinates : (${profile.latitude} , ${profile.longitude})', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: (Theme.of(context).textTheme.bodyMedium!.fontSize)! * (Provider.of<AppState>(context).currentProfile?.fontSizeMultiplier ?? 1)))
          ],
        ),
        trailing: Container(
          width: 40, height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: FlexThemeData.light(scheme: profile.theme).primaryColor
          ),
        )
      ),
    );
  }
}
