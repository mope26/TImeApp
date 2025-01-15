import 'package:flutter/material.dart';

class Stylebtn extends StatelessWidget {
  final Function() onPressed;
  final Widget child;


  const Stylebtn({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
