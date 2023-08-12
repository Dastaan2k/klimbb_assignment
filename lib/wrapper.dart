import 'dart:math';

import 'package:flutter/material.dart';
import 'package:klimbb_assignment/helpers/local_db_helper.dart';
import 'package:klimbb_assignment/helpers/shared_preferences_helper.dart';
import 'package:klimbb_assignment/providers/app_state.dart';
import 'package:klimbb_assignment/providers/navigator_state.dart';
import 'package:klimbb_assignment/views/home/home_page.dart';
import 'package:klimbb_assignment/views/location_input/location_input_page.dart';
import 'package:klimbb_assignment/views/splash/splash_page.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Provider.of<AppState>(context, listen: false).loadInitialData();

    return Consumer<AppState>(
      builder: (context, prov, __) {
        return prov.dataLoaded ? prov.currentProfile == null ? const LocationInputPage() : const HomePage() : const SplashPage();
      }
    );
  }
}
