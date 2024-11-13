import 'package:flutter/material.dart';

class StyledTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String placeholder;
  final IconData? icon;
  final VoidCallback? onTap;
  final int minLines;
  final int maxLines;
  final bool disabled;

  const StyledTextFormField({
    super.key,
    required this.placeholder,
    required this.controller,
    this.minLines = 1,
    this.maxLines = 1,
    this.icon,
    this.validator,
    this.onTap,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      enabled: !disabled,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: const TextStyle(fontSize: 16, color: Color(0xff1B1B1D), fontWeight: FontWeight.normal),
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xffE0E0E0)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Color(0xffE0E0E0)),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red),
        ),
        fillColor: Colors.white,
        suffixIcon: icon != null
            ? Opacity(
                opacity: disabled ? 0.4 : 1,
                child: Icon(icon, color: const Color(0xff4A3780)),
              )
            : null,
      ),
      minLines: minLines,
      maxLines: maxLines,
    );
  }
}
