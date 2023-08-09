import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:klimbb_assignment/providers/create_profile_state.dart';
import 'package:provider/provider.dart';

import '../../providers/app_state.dart';

class ThemeSelectorWidget extends StatefulWidget {

  final FlexScheme value;
  final bool Function(FlexScheme) isSelected;
  final Function(FlexScheme?) onChanged;

  const ThemeSelectorWidget({Key? key, required this.value, required this.onChanged, required this.isSelected}) : super(key: key);

  @override
  State<ThemeSelectorWidget> createState() => _ThemeSelectorWidgetState();
}

class _ThemeSelectorWidgetState extends State<ThemeSelectorWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Text('Theme : ', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: (Theme.of(context).textTheme.bodyMedium!.fontSize)! * (Provider.of<AppState>(context).deviceProfile?.fontSizeMultiplier ?? 1))),
          const SizedBox(width: 15),
          Expanded(
            child: DropdownButton<FlexScheme>(
              isExpanded: true,
                value: widget.value,
                items: FlexScheme.values.map((e) => DropdownMenuItem<FlexScheme>(value: e, child: Text(e.name, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: widget.isSelected(e) ? Theme.of(context).primaryColor : Theme.of(context).textTheme.bodyMedium!.color, fontSize: (Theme.of(context).textTheme.bodyMedium!.fontSize)! * (Provider.of<AppState>(context).deviceProfile?.fontSizeMultiplier ?? 1))))).toList(),
                onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
