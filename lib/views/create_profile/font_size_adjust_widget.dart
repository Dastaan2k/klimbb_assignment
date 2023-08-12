import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_state.dart';

class FontSizeAdjustWidget extends StatelessWidget {

  final double value;
  final String label;
  final Function(double) onChanged;
  final double? fontMultiplier;
  final FlexScheme? theme;

  const FontSizeAdjustWidget({Key? key, required this.value, required this.label, required this.onChanged, this.fontMultiplier, this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Font size multiplier', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: (Theme.of(context).textTheme.bodyMedium!.fontSize)! * ((fontMultiplier ?? Provider.of<AppState>(context).currentProfile?.fontSizeMultiplier) ?? 1))),
        Theme(
          data: theme != null ? FlexThemeData.light(scheme: theme, useMaterial3: true) : Theme.of(context),
            child: Slider(value: value, min: 1, max: 1.25, divisions: 2, onChanged: onChanged, label: label)
        ),
      ],
    );
  }
}
