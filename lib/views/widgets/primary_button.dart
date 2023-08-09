import 'package:flutter/material.dart';

class KPrimaryButton extends StatelessWidget {

  final String text;
  final VoidCallback? onTap;

  const KPrimaryButton({Key? key, required this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
        onPressed: onTap,
        child: Text(text, style: TextStyle(color: Colors.white))
    );
  }
}
