import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klimbb_assignment/providers/app_state.dart';
import 'package:klimbb_assignment/providers/create_profile_state.dart';
import 'package:klimbb_assignment/views/create_profile/font_size_adjust_widget.dart';
import 'package:klimbb_assignment/views/create_profile/theme_selector_widget.dart';
import 'package:klimbb_assignment/views/home/home_page.dart';
import 'package:provider/provider.dart';

import '../../helpers/local_db_helper.dart';
import '../../models/device_profile.dart';
import '../../utils/globals.dart';
import '../widgets/primary_button.dart';
import '../widgets/textfield.dart';

class CreateProfileDialog extends StatefulWidget {

  final double lat, long;

  const CreateProfileDialog({Key? key, required this.lat, required this.long}) : super(key: key);

  @override
  State<CreateProfileDialog> createState() => _CreateProfileDialogState();
}

class _CreateProfileDialogState extends State<CreateProfileDialog> {
  @override
  Widget build(BuildContext context) {

    var nameController = TextEditingController();
    var latController = TextEditingController(text: widget.lat.toString());
    var longController = TextEditingController(text: widget.long.toString());

    Provider.of<CreateProfileState>(context, listen: false).resetToInitialState();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KGlobals.defaultSpacing, vertical: KGlobals.defaultSpacing),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Profile', style: Theme.of(context).textTheme.headlineMedium),
              const Text('New lat long detected'),
              const SizedBox(height: KGlobals.defaultSpacing * 2),
              KTextField(label: 'Name', controller: nameController),
              const SizedBox(height: KGlobals.defaultSpacing),
              Consumer<CreateProfileState>(
                builder: (context, provider, child) {
                  return ThemeSelectorWidget(value: provider.selectedTheme, onChanged: (FlexScheme? value) {
                    Provider.of<CreateProfileState>(context, listen: false).changeTheme(value ?? FlexScheme.material);
                  }, isSelected: (FlexScheme theme) => (theme == Provider.of<CreateProfileState>(context).selectedTheme));
                }
              ),
              const SizedBox(height: KGlobals.defaultSpacing),
              Consumer<CreateProfileState>(
                builder: (context, provider, child) {
                  return FontSizeAdjustWidget(value: provider.fontSizeMultiplier, label: '  ${provider.fontSizeMultiplier} x  ', onChanged: (value) {
                    Provider.of<CreateProfileState>(context, listen: false).changeFontSizeMultiplier(value);
                  });
                }
              ),
              const SizedBox(height: KGlobals.defaultSpacing),
              KTextField(label: 'Latitude', textInputType: TextInputType.number, isEnabled: false, controller: latController),
              const SizedBox(height: KGlobals.defaultSpacing),
              KTextField(label: 'Longitude', textInputType: TextInputType.number, isEnabled: false, controller: longController),
              const SizedBox(height: KGlobals.defaultSpacing),
              Center(
                  child: KPrimaryButton(
                    onTap: () {
                      if(nameController.text != '') {
                        createCallback(DeviceProfile(name: nameController.text, latitude: widget.lat, longitude: widget.long, theme: Provider.of<CreateProfileState>(context, listen: false).selectedTheme, fontSizeMultiplier: Provider.of<CreateProfileState>(context, listen: false).fontSizeMultiplier), context);
                      }
                      else {
                        Fluttertoast.showToast(msg: 'Name is required');
                      }
                    },
                    text: 'Create'
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  createCallback(DeviceProfile deviceProfile, BuildContext context) async {
    var createProfileResponse = await LocalDBHelper.postProfile(deviceProfile);
    if(createProfileResponse.error == true) {
      Fluttertoast.showToast(msg: createProfileResponse.reasonPhrase!);
    }
    else {
      if(mounted) {
        Navigator.pop(context);
        Provider.of<AppState>(context, listen: false).setCurrentProfile(createProfileResponse.data!);
      }
    }
  }
}
