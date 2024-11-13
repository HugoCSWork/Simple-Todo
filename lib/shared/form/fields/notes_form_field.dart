import 'package:flutter/material.dart';
import 'package:simple_todo/shared/form/form_field_wrapper.dart';
import 'package:simple_todo/shared/form/styled_text_form_field.dart';

class NotesFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool disabled;
  final bool editing;

  const NotesFormField(this.controller, {this.disabled = false, this.editing = false, super.key});

  @override
  Widget build(BuildContext context) {
    return FormFieldWrapper(
      title: 'Notes',
      child: StyledTextFormField(
        key: const Key('notes_form_field'),
        disabled: disabled,
        placeholder: editing ? "" : "Notes",
        controller: controller,
        minLines: 6,
        maxLines: 6,
      ),
    );
  }
}
