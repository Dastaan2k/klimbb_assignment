import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:klimbb_assignment/helpers/local_db_helper.dart';
import 'package:klimbb_assignment/providers/app_state.dart';
import 'package:klimbb_assignment/providers/create_profile_state.dart';
import 'package:klimbb_assignment/wrapper.dart';
import 'package:provider/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //(await SharedPreferences.getInstance()).clear();
  await LocalDBHelper.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppState>(create: (_) => AppState()),
      ChangeNotifierProvider<CreateProfileState>(create: (_) => CreateProfileState())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klimbb Assignment',
      theme: FlexThemeData.light(scheme: Provider.of<AppState>(context).currentProfile?.theme ?? FlexScheme.material, useMaterial3: true),
      darkTheme: FlexThemeData.dark(scheme: Provider.of<AppState>(context).currentProfile?.theme ?? FlexScheme.material, useMaterial3: true),
      themeMode: ThemeMode.light,
      home: const Wrapper(),
    );
  }
}

