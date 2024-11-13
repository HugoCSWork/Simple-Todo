import 'package:flutter/material.dart';

class FormFieldWrapper extends StatelessWidget {
  final String title;
  final Widget child;
  const FormFieldWrapper({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 2),
        child,
      ],
    );
  }
}
