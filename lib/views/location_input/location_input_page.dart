import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klimbb_assignment/helpers/local_db_helper.dart';
import 'package:klimbb_assignment/models/device_profile.dart';
import 'package:klimbb_assignment/utils/globals.dart';
import 'package:klimbb_assignment/utils/theme.dart';
import 'package:klimbb_assignment/views/create_profile/create_profile_dialog.dart';
import 'package:klimbb_assignment/views/home/home_page.dart';
import 'package:provider/provider.dart';

import '../../providers/app_state.dart';
import '../../providers/create_profile_state.dart';
import '../widgets/primary_button.dart';
import '../widgets/textfield.dart';

class LocationInputPage extends StatefulWidget {
  const LocationInputPage({Key? key}) : super(key: key);

  @override
  State<LocationInputPage> createState() => _LocationInputPageState();
}

class _LocationInputPageState extends State<LocationInputPage> {

  var latController = TextEditingController();
  var longController = TextEditingController();


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AppState>(context, listen: false).setDeviceProfile(null);
      Provider.of<CreateProfileState>(context, listen: false).resetToInitialState();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter location', style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 40),
                  KTextField(label: 'Latitude', textInputType: TextInputType.number, controller: latController),
                  const SizedBox(height: 15),
                  KTextField(label: 'Longitude', textInputType: TextInputType.number, controller: longController),
                  const SizedBox(height: 40),
                  Center(
                    child: KPrimaryButton(text: 'Confirm', onTap: () {
                      if(((double.tryParse(latController.text) != null) && (double.tryParse(longController.text) != null)) && ((double.parse(latController.text) < 90 && double.parse(latController.text) > -90) && (double.parse(longController.text) < 180 && double.parse(longController.text) > -180))) {
                        confirmCallback(double.parse(latController.text), double.parse(longController.text), context);
                      }
                      else {
                        Fluttertoast.showToast(msg: 'Invalid lat long');
                      }
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  confirmCallback(double lat, double long, BuildContext context) async {
      var getProfileResponse = await LocalDBHelper.getUser(lat, long);
      if(getProfileResponse.error == true) {
        if(getProfileResponse.status == 404) {
          showDialog(context: context, builder: (_) => CreateProfileDialog(lat: lat, long: long));
        }
        else {
          Fluttertoast.showToast(msg: getProfileResponse.reasonPhrase!);
        }
      }
      else {
        Provider.of<AppState>(context, listen: false).setDeviceProfile(getProfileResponse.data!);
        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_) => const HomePage()));
      }
  }
}
