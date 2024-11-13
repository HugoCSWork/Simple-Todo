import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

bool useFormValidation({
  required GlobalKey<FormState> formKey,
  List<TextEditingController> controllers = const [],
  required ValueNotifier<bool> hasSubmitted,
}) {
  // Create the ValueNotifier for form validity
  final formValidNotifier = useState(false);

  useEffect(() {
    void validateForm() {
      if (hasSubmitted.value) {
        formValidNotifier.value = formKey.currentState?.validate() ?? false;
      }
    }

    if (hasSubmitted.value) {
      for (var controller in controllers) {
        controller.addListener(validateForm);
      }

      validateForm();
    }

    return () {
      for (var controller in controllers) {
        controller.removeListener(validateForm);
      }
    };
  }, [formKey, controllers, hasSubmitted.value]);

  useEffect(() {
    return () {
      for (var controller in controllers) {
        controller.dispose();
      }
    };
  }, []);

  // Return the form validity notifier
  return formValidNotifier.value;
}
