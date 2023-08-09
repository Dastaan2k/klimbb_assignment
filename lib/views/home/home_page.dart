import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klimbb_assignment/helpers/local_db_helper.dart';
import 'package:klimbb_assignment/models/device_profile.dart';
import 'package:klimbb_assignment/providers/app_state.dart';
import 'package:klimbb_assignment/utils/globals.dart';
import 'package:klimbb_assignment/views/create_profile/font_size_adjust_widget.dart';
import 'package:klimbb_assignment/views/create_profile/theme_selector_widget.dart';
import 'package:klimbb_assignment/views/local_profiles_list/profile_list_page.dart';
import 'package:klimbb_assignment/views/location_input/location_input_page.dart';
import 'package:provider/provider.dart';

import '../../providers/create_profile_state.dart';
import '../widgets/spinner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<AppState>(context).deviceProfile != null ? Scaffold(
      appBar: AppBar(
          title: Text(Provider.of<AppState>(context).deviceProfile?.name ?? 'No name'),
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_) => const LocationInputPage()));
                },
                  child: const Icon(Icons.logout)
              ),
            )
          ],
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text('Device profile settings', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: (Theme.of(context).textTheme.headlineSmall!.fontSize)! * (Provider.of<AppState>(context).deviceProfile?.fontSizeMultiplier ?? 1))),
            const SizedBox(height: 20),
            Consumer<AppState>(
              builder: (context, provider, child) {
                return ThemeSelectorWidget(value: provider.deviceProfile?.theme ?? FlexScheme.material, onChanged: (theme) async {
                  LocalDBHelper.updateUser(Provider.of<AppState>(context, listen: false).deviceProfile!.copyWith(theme: theme));
                  Provider.of<AppState>(context, listen: false).setDeviceProfile(Provider.of<AppState>(context, listen: false).deviceProfile!.copyWith(theme: theme));
                }, isSelected: (FlexScheme theme) => (theme == Provider.of<AppState>(context).deviceProfile!.theme));
              }
            ),
            const SizedBox(height: 20),
            Consumer<AppState>(
              builder: (context, provider, child) {
                return FontSizeAdjustWidget(value: provider.deviceProfile!.fontSizeMultiplier, label: '  ${provider.deviceProfile!.fontSizeMultiplier} x  ', onChanged: (value) async {
                  LocalDBHelper.updateUser(Provider.of<AppState>(context, listen: false).deviceProfile!.copyWith(fontSizeMultiplier: value));
                  Provider.of<AppState>(context, listen: false).setDeviceProfile(Provider.of<AppState>(context, listen: false).deviceProfile!.copyWith(fontSizeMultiplier: value));
                });
              }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (_) => const ProfileListPage()));
        },
        child: const Icon(Icons.list),
      ),
    ) : const Material(
      child: Center(child: Spinner()),
    );
  }
}
