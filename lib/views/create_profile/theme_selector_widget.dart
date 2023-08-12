import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_state.dart';

class ThemeSelectorWidget extends StatefulWidget {

  final FlexScheme value;
  final bool Function(FlexScheme) isSelected;
  final Function(FlexScheme?) onChanged;
  final FlexScheme? theme;
  final double? fontMultiplier;

  const ThemeSelectorWidget({Key? key, required this.value, required this.onChanged, required this.isSelected, this.theme, this.fontMultiplier}) : super(key: key);

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
          Text('Theme : ', style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: (Theme.of(context).textTheme.bodyMedium!.fontSize)! * ((widget.fontMultiplier ?? Provider.of<AppState>(context).currentProfile?.fontSizeMultiplier) ?? 1))),
          const SizedBox(width: 15),
          Expanded(
            child: DropdownButton<FlexScheme>(
              isExpanded: true,
                value: widget.value,
                items: FlexScheme.values.map((e) => DropdownMenuItem<FlexScheme>(value: e, child: Row(
                  children: [
                    Container(
                      width: 25, height: 25,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: FlexThemeData.light(scheme: e).primaryColor),
                    ),
                    const SizedBox(width: 10),
                    Text(e.name, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: widget.isSelected(e) ? (widget.theme != null ? FlexThemeData.light(scheme: widget.theme) : Theme.of(context)).primaryColor : Theme.of(context).textTheme.bodyMedium!.color, fontSize: (Theme.of(context).textTheme.bodyMedium!.fontSize)! * ((widget.fontMultiplier ?? Provider.of<AppState>(context).currentProfile?.fontSizeMultiplier) ?? 1))),
                  ],
                ))).toList(),
                onChanged: widget.onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
