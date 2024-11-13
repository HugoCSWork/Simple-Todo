import 'package:flutter/material.dart';
import 'package:simple_todo/shared/form/form_field_wrapper.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:simple_todo/shared/form/styled_text_form_field.dart';

class TitleFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool disabled;

  const TitleFormField(this.controller, {this.disabled = false, super.key});

  @override
  Widget build(BuildContext context) {
    return FormFieldWrapper(
      title: 'Task Title',
      child: StyledTextFormField(
        key: const Key('title_form_field'),
        placeholder: "Title",
        controller: controller,
        disabled: disabled,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(errorText: 'Field is required'),
          FormBuilderValidators.minLength(3, errorText: 'Title must be atleast 3 characters'),
          FormBuilderValidators.maxLength(36, errorText: 'Title must be no more than 36 characters'),
        ]),
      ),
    );
  }
}
