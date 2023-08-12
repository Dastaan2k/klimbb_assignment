import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klimbb_assignment/helpers/local_db_helper.dart';
import 'package:klimbb_assignment/models/device_profile.dart';
import 'package:klimbb_assignment/providers/app_state.dart';
import 'package:klimbb_assignment/utils/globals.dart';
import 'package:klimbb_assignment/views/create_profile/font_size_adjust_widget.dart';
import 'package:klimbb_assignment/views/create_profile/theme_selector_widget.dart';
import 'package:klimbb_assignment/views/local_profiles_list/profile_list_page.dart';
import 'package:klimbb_assignment/views/location_input/location_input_page.dart';
import 'package:provider/provider.dart';

import '../widgets/primary_button.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late double fontMultiplier;
  late FlexScheme theme;

  @override
  void initState() {
    fontMultiplier = Provider.of<AppState>(context, listen: false).currentProfile!.fontSizeMultiplier;
    theme = Provider.of<AppState>(context, listen: false).currentProfile!.theme;
    Provider.of<AppState>(context, listen: false).addListener(() {
      if(mounted && Provider.of<AppState>(context, listen: false).currentProfile != null) {
        setState(() {
          fontMultiplier = Provider.of<AppState>(context, listen: false).currentProfile!.fontSizeMultiplier;
          theme = Provider.of<AppState>(context, listen: false).currentProfile!.theme;
        });
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(Provider.of<AppState>(context).currentProfile?.name ?? 'No name'),
          backgroundColor: FlexThemeData.light(scheme: theme).secondaryHeaderColor,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: KGlobals.defaultSpacing),
              child: InkWell(
                onTap: () {
                  Provider.of<AppState>(context, listen: false).setCurrentProfile(null);
                },
                  child: const Icon(Icons.logout)
              ),
            )
          ],
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: KGlobals.defaultSpacing, vertical: KGlobals.defaultSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: KGlobals.defaultSpacing),
            Text('Device profile settings', style: FlexThemeData.light(scheme: theme).textTheme.headlineSmall!.copyWith(fontSize: (Theme.of(context).textTheme.headlineSmall!.fontSize)! * fontMultiplier)),
            const SizedBox(height: KGlobals.defaultSpacing),
            Consumer<AppState>(
              builder: (context, provider, child) {
                return ThemeSelectorWidget(value: theme, onChanged: (theme) async {
                  setState(() {
                    this.theme = theme ?? FlexScheme.material;
                  });
                }, isSelected: (FlexScheme theme) => (theme == this.theme), theme: theme, fontMultiplier: fontMultiplier);
              }
            ),
            const SizedBox(height: KGlobals.defaultSpacing),
            Consumer<AppState>(
              builder: (context, provider, child) {
                return FontSizeAdjustWidget(value: fontMultiplier, label: '  ${provider.currentProfile!.fontSizeMultiplier} x  ', onChanged: (value) async {
                  setState(() {
                    fontMultiplier = value;
                  });
                }, theme: theme, fontMultiplier: fontMultiplier);
              }
            ),
            const SizedBox(height: KGlobals.defaultSpacing),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  KPrimaryButton(text: 'Undo', onTap: Provider.of<AppState>(context).currentProfile!.fontSizeMultiplier == fontMultiplier && Provider.of<AppState>(context).currentProfile!.theme == theme ? null :  () async {
                    setState(() {
                      fontMultiplier = Provider.of<AppState>(context, listen: false).currentProfile!.fontSizeMultiplier;
                      theme = Provider.of<AppState>(context, listen: false).currentProfile!.theme;
                    });
                  }, fontMultiplier: fontMultiplier, theme: theme),
                  const SizedBox(width: 20),
                  KPrimaryButton(text: 'Apply', onTap: Provider.of<AppState>(context).currentProfile!.fontSizeMultiplier == fontMultiplier && Provider.of<AppState>(context).currentProfile!.theme == theme ? null :  () async {
                    var res = Provider.of<AppState>(context, listen: false).currentProfile!.copyWith(fontSizeMultiplier: fontMultiplier, theme: theme);
                    var res1 = await LocalDBHelper.updateProfile(res);
                    if(res1.error) {
                      Fluttertoast.showToast(msg: '${res1.status} : ${res1.reasonPhrase}');
                    }
                    else {
                      if(mounted) {
                        Provider.of<AppState>(context, listen: false).setCurrentProfile(res1.data);
                      }
                    }
                  }, fontMultiplier: fontMultiplier, theme: theme)
                ],
              ),
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
    );
  }
}
