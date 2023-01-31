import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback OnPressed;
  MyButton({super.key, required this.OnPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: OnPressed,
      child: Text(text),
      color: Theme.of(context).primaryColor,
    );
  }
}
