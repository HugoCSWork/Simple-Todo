import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_todo/extensions/form_extensions.dart';
import 'package:simple_todo/features/create_task/create_task_form.dart';
import 'package:simple_todo/features/create_task/create_task_provider.dart';
import 'package:simple_todo/hooks/use_form_validation.dart';
import 'package:simple_todo/shared/form/fields/category_form_field.dart';
import 'package:simple_todo/shared/form/fields/date_form_field.dart';
import 'package:simple_todo/shared/form/fields/notes_form_field.dart';
import 'package:simple_todo/shared/form/fields/time_form_field.dart';
import 'package:simple_todo/shared/form/fields/title_form_field.dart';
import 'package:simple_todo/shared/styled_button.dart';

class CreateTaskPage extends HookWidget {
  const CreateTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>(debugLabel: 'create_task_form'));
    final createTaskModel = useMemoized(() => CreateTaskForm());
    final hasSubmitted = useState<bool>(false);

    final isValid =
        useFormValidation(formKey: formKey, controllers: createTaskModel.controllers, hasSubmitted: hasSubmitted);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xffF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xff4A3870),
        toolbarHeight: 95,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Add New Task', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 20, 12, 16),
            child: Column(
              children: [
                TitleFormField(createTaskModel.titleController),
                const SizedBox(height: 20),
                CategoryFormField(createTaskModel.categoryController, hasSubmitted.value),
                const SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(child: DateFormField(createTaskModel.dateController)),
                      const SizedBox(width: 20),
                      Expanded(child: TimeFormField(createTaskModel.timeController)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                NotesFormField(createTaskModel.notesController),
                const SizedBox(height: 30),
                Consumer(builder: (context, ref, _) {
                  return SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: StyledButton(
                      text: 'Create',
                      disabled: hasSubmitted.value && !isValid,
                      onPressed: () {
                        hasSubmitted.value = true;
                        if (formKey.isFormValid) {
                          ref.read(createTaskProvider(createTaskModel).future);
                          context.pop();
                        }
                      },
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
