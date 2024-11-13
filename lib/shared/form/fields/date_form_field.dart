import 'package:flutter/material.dart';
import 'package:simple_todo/extensions/datetime_extensions.dart';
import 'package:simple_todo/extensions/string_extensions.dart';
import 'package:simple_todo/shared/form/form_field_wrapper.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:simple_todo/shared/form/styled_text_form_field.dart';

class DateFormField extends StatelessWidget {
  final bool disabled;
  final TextEditingController controller;

  const DateFormField(this.controller, {this.disabled = false, super.key});

  @override
  Widget build(BuildContext context) {
    return FormFieldWrapper(
      title: 'Date',
      child: StyledTextFormField(
        key: const Key('date_form_field'),
        disabled: disabled,
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          var date = await showDatePicker(
            context: context,
            initialDate: controller.text.isNotEmpty ? controller.text.toDate : null,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365 * 35)),
          );

          if (date != null) controller.text = date.stringFormat;
        },
        placeholder: "Date",
        icon: Icons.calendar_today,
        controller: controller,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(errorText: 'Field is required'),
        ]),
      ),
    );
  }
}
