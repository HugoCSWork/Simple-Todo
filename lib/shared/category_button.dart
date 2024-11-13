import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final bool selected;
  final Color color;
  final bool disabled;

  const CategoryButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.color,
    this.selected = false,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? null : onTap,
      child: Opacity(
        opacity: disabled ? 0.4 : 1,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: selected ? const Color(0xff4A3780) : Colors.white, width: 2),
            color: color,
          ),
          child: Icon(
            icon,
            color: const Color(0xff4A3780),
          ),
        ),
      ),
    );
  }
}
