import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool disabled;
  final bool loading;

  const StyledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.loading = false,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape:
            const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)))),
        backgroundColor: WidgetStatePropertyAll(disabled ? const Color(0xffE7E2F3) : const Color(0xff4A3780)),
      ),
      onPressed: disabled ? null : onPressed,
      child: loading
          ? const CircularProgressIndicator(color: Color(0xff4A3780))
          : Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
