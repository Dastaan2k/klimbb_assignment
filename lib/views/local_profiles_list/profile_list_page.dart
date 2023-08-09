import 'package:flutter/material.dart';
import 'package:klimbb_assignment/helpers/local_db_helper.dart';
import 'package:klimbb_assignment/models/device_profile.dart';
import 'package:klimbb_assignment/views/local_profiles_list/profile_card.dart';
import 'package:provider/provider.dart';

import '../../providers/app_state.dart';

class ProfileListPage extends StatelessWidget {
  const ProfileListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Local profiles', style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(fontSize: (Theme.of(context).appBarTheme.titleTextStyle?.fontSize)! * (Provider.of<AppState>(context).deviceProfile?.fontSizeMultiplier ?? 1))), backgroundColor: Theme.of(context).secondaryHeaderColor),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text('Select a profile to swap', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: (Theme.of(context).textTheme.headlineSmall!.fontSize)! * (Provider.of<AppState>(context).deviceProfile?.fontSizeMultiplier ?? 1))),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: FutureBuilder<DBResponse<List<DeviceProfile>>>(
              future: LocalDBHelper.getAllProfiles(),
              builder: (context, future) {
                if(future.hasData) {
                  if(future.data!.error == true) {
                    return Center(child: Text(future.data!.reasonPhrase!));
                  }
                  else {
                    if(future.data!.data!.isEmpty) {
                      return const Center(child: Text('No profiles created'));
                    }
                    else {
                      return ListView.builder(itemCount: future.data!.data!.length, itemBuilder: (context, index) => ProfileCard(profile: future.data!.data![index]));
                    }
                  }
                }
                else {
                  return const Center(child: CircularProgressIndicator());
                }
              }
            ),
          )
        ],
      ),
    );
  }
}
