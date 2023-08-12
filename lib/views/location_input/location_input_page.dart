import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:klimbb_assignment/helpers/local_db_helper.dart';
import 'package:klimbb_assignment/utils/globals.dart';
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

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: KGlobals.defaultSpacing),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter location', style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: KGlobals.defaultSpacing * 2),
                    KTextField(
                      label: 'Latitude', textInputType: TextInputType.number, controller: latController,
                      validator: (value) {
                          if(value != null) {
                            if(double.tryParse(value) == null) {
                              return 'Enter a valid input';
                            }
                            else {
                              if(double.parse(value) > 90 || double.parse(value) < -90) {
                                return 'Latitude out of range';
                              }
                            }
                          }
                          return null;
                      },
                      onChanged: (value) {
                          formKey.currentState!.validate();
                      },
                    ),
                    const SizedBox(height: KGlobals.defaultSpacing),
                    KTextField(
                        label: 'Longitude', textInputType: TextInputType.number, controller: longController,
                      validator: (value) {
                        if(value != null) {
                          if(double.tryParse(value) == null) {
                            return 'Enter a valid input';
                          }
                          else {
                            if(double.parse(value) > 180 || double.parse(value) < -180) {
                              return 'Longitude out of range';
                            }
                          }
                        }
                        return null;
                      },
                      onChanged: (value) {
                        formKey.currentState!.validate();
                      },
                    ),
                    const SizedBox(height: KGlobals.defaultSpacing * 2),
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
      ),
    );
  }

  confirmCallback(double lat, double long, BuildContext context) async {
    print('Here');
      var getProfileResponse = await LocalDBHelper.getProfileFromLatLng(lat, long);
      print('Resp : $getProfileResponse');
      if(getProfileResponse.error == true) {
        if(getProfileResponse.status == 404) {
          if(mounted) {
            showDialog(context: context, builder: (_) => CreateProfileDialog(lat: lat, long: long));
          }
        }
        else {
          Fluttertoast.showToast(msg: getProfileResponse.reasonPhrase!);
        }
      }
      else {
        if(mounted) {
          Provider.of<AppState>(context, listen: false).setCurrentProfile(getProfileResponse.data!);
        }
      }
  }
}
