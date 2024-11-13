import 'package:flutter/material.dart';
import 'package:simple_todo/extensions/string_extensions.dart';
import 'package:simple_todo/extensions/time_of_day_extensions.dart';
import 'package:simple_todo/shared/form/form_field_wrapper.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:simple_todo/shared/form/styled_text_form_field.dart';

class TimeFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool disabled;

  const TimeFormField(this.controller, {this.disabled = false, super.key});

  @override
  Widget build(BuildContext context) {
    return FormFieldWrapper(
      title: 'Time',
      child: StyledTextFormField(
        key: const Key('time_form_field'),
        disabled: disabled,
        onTap: () async {
          FocusScope.of(context).requestFocus(FocusNode());
          // TODO: Add validation to ensure they don't select time earlier than now if selected date is today
          final initialTime = controller.text.toTimeOfDay;
          var time = await showTimePicker(
            context: context,
            initialTime: initialTime,
          );

          if (time != null) controller.text = time.stringFormat;
        },
        placeholder: "Time",
        icon: Icons.access_time,
        controller: controller,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(errorText: 'Field is required'),
        ]),
      ),
    );
  }
}
