import 'package:flutter/material.dart';


class KTextField extends StatelessWidget {

  final String? hint;
  final String label;
  final TextInputType textInputType;
  final bool isReadOnly;
  final bool isEnabled;
  final TextEditingController? controller;

  const KTextField({Key? key, this.controller, this.hint, this.label = '', this.textInputType = TextInputType.text, this.isReadOnly = false, this.isEnabled = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextField(
      controller: controller,
        keyboardType: textInputType,
        readOnly: isReadOnly,
        decoration: InputDecoration(
          filled: true,
          hintText: hint ?? label,
          labelText: label,
          enabled: isEnabled,
          border: const OutlineInputBorder()
        )
    );
  }
}
