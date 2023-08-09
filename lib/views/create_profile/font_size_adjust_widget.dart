import 'package:flutter/material.dart';
import 'package:klimbb_assignment/providers/create_profile_state.dart';
import 'package:provider/provider.dart';

import '../../providers/app_state.dart';

class FontSizeAdjustWidget extends StatelessWidget {

  final double value;
  final String label;
  final Function(double) onChanged;

  const FontSizeAdjustWidget({Key? key, required this.value, required this.label, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Font size multiplier', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: (Theme.of(context).textTheme.bodyMedium!.fontSize)! * (Provider.of<AppState>(context).deviceProfile?.fontSizeMultiplier ?? 1))),
        Slider(value: value, min: 1, max: 1.5, divisions: 2, onChanged: onChanged, label: label),
      ],
    );
  }
}
