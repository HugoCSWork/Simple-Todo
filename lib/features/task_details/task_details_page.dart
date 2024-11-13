import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_todo/extensions/form_extensions.dart';
import 'package:simple_todo/features/task_details/task_details_form.dart';
import 'package:simple_todo/features/task_details/task_details_provider.dart';
import 'package:simple_todo/hooks/use_form_validation.dart';
import 'package:simple_todo/shared/form/fields/category_form_field.dart';
import 'package:simple_todo/shared/form/fields/date_form_field.dart';
import 'package:simple_todo/shared/form/fields/notes_form_field.dart';
import 'package:simple_todo/shared/form/fields/time_form_field.dart';
import 'package:simple_todo/shared/form/fields/title_form_field.dart';
import 'package:simple_todo/shared/styled_button.dart';

class TaskDetailsPage extends HookConsumerWidget {
  final int id;
  const TaskDetailsPage(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final individualTaskStatus = ref.watch(getIndividualTaskProvider(id));

    return individualTaskStatus.maybeMap(
      data: (task) {
        final formKey = useMemoized(() => GlobalKey<FormState>(debugLabel: 'task_details_form'));
        final taskDetailsModel = useMemoized(() => TaskDetailsForm(task.value));
        final hasSubmitted = useState<bool>(false);
        final disabled = useState<bool>(true);

        final isValid =
            useFormValidation(formKey: formKey, controllers: taskDetailsModel.controllers, hasSubmitted: hasSubmitted);

        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color(0xffF1F5F9),
          appBar: AppBar(
            backgroundColor: const Color(0xff4A3870),
            toolbarHeight: 95,
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text('Task Details', style: TextStyle(color: Colors.white)),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () => disabled.value = !disabled.value,
                child: const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.edit, color: Colors.white, size: 24),
                ),
              ),
            ],
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 12, 16),
                child: Column(
                  children: [
                    TitleFormField(taskDetailsModel.titleController, disabled: disabled.value),
                    const SizedBox(height: 20),
                    CategoryFormField(taskDetailsModel.categoryController, hasSubmitted.value,
                        disabled: disabled.value),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(child: DateFormField(taskDetailsModel.dateController, disabled: disabled.value)),
                          const SizedBox(width: 20),
                          Expanded(child: TimeFormField(taskDetailsModel.timeController, disabled: disabled.value)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    NotesFormField(taskDetailsModel.notesController, disabled: disabled.value, editing: true),
                    const SizedBox(height: 30),
                    Consumer(builder: (context, ref, _) {
                      return SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: StyledButton(
                          text: 'Update',
                          disabled: (hasSubmitted.value && !isValid) || disabled.value,
                          onPressed: () {
                            hasSubmitted.value = true;
                            if (formKey.isFormValid) {
                              ref.read(updateTodoByFormProvider(taskDetailsModel).future);
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
      },
      orElse: () {
        return const SizedBox();
      },
    );
    // if(existingTask)
  }
}
