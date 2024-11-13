import 'package:flutter/material.dart';
import 'package:simple_todo/shared/category_button.dart';

class CategoryFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool hasSubmitted;
  final bool disabled;
  const CategoryFormField(this.controller, this.hasSubmitted, {this.disabled = false, super.key});

  @override
  State<CategoryFormField> createState() => _CategoryFormFieldState();
}

class _CategoryFormFieldState extends State<CategoryFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text('Category', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            const SizedBox(width: 20),
            CategoryButton(
              onTap: () => updateText("0"),
              icon: Icons.list_alt,
              color: const Color(0xffDBECF6),
              selected: widget.controller.text == "0",
              disabled: widget.disabled,
            ),
            const SizedBox(width: 15),
            CategoryButton(
              onTap: () => updateText("1"),
              icon: Icons.calendar_month,
              color: const Color(0xffE7E2F3),
              selected: widget.controller.text == "1",
              disabled: widget.disabled,
            ),
            const SizedBox(width: 15),
            CategoryButton(
              onTap: () => updateText("2"),
              icon: Icons.golf_course_sharp,
              color: const Color(0xffFEF5D3),
              selected: widget.controller.text == "2",
              disabled: widget.disabled,
            ),
          ],
        ),
        if (widget.hasSubmitted && widget.controller.text.isEmpty) ...[
          const SizedBox(height: 1),
          Text(
            'Category is required ',
            style: TextStyle(
              color: Theme.of(context).colorScheme.error,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          )
        ]
      ],
    );
  }

  void updateText(String index) => setState(() => widget.controller.text = index);
}
