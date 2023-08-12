import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:klimbb_assignment/providers/app_state.dart';
import 'package:provider/provider.dart';

class KPrimaryButton extends StatelessWidget {

  final String text;
  final VoidCallback? onTap;
  final double? fontMultiplier;
  final FlexScheme? theme;

  const KPrimaryButton({Key? key, required this.text, this.onTap, this.fontMultiplier, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: (theme != null ? FlexThemeData.light(scheme: theme, useMaterial3: true) : Theme.of(context)).primaryColor),
        onPressed: onTap,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 14 * (fontMultiplier ?? Provider.of<AppState>(context).currentProfile?.fontSizeMultiplier ?? 1)))
    );
  }
}
