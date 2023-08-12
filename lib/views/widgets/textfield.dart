import 'package:flutter/material.dart';


class KTextField extends StatelessWidget {

  final String? hint;
  final String label;
  final TextInputType textInputType;
  final bool isReadOnly;
  final bool isEnabled;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const KTextField({Key? key, this.controller, this.hint, this.label = '', this.textInputType = TextInputType.text, this.isReadOnly = false, this.isEnabled = true, this.validator, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: controller,
        keyboardType: textInputType,
        readOnly: isReadOnly,
        onChanged: onChanged,
        validator: validator,
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
