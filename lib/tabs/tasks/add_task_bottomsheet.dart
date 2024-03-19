import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/tabs/tasks/default_elevated_button.dart';
import 'package:todo/tabs/tasks/default_text_form_field.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate = DateTime.now();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            "Add New Task",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppTheme.blackColor,
                ),
          ),
          DefaultTextFormField(
            controller: titleController,
            hintText: 'Enter Task Title',
          ),
          SizedBox(
            height: 16,
          ),
          DefaultTextFormField(
            controller: descriptionController,
            hintText: 'Enter Task Description',
            maxLines: 5,
          ),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Selected Date',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          InkWell(
            onTap: () async {
              final dateTime = await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  const Duration(days: 365),
                ),
                initialDate: DateTime.now(),
              );
              if (dateTime != null) selectedDate = dateTime;
            },
            child: Text(
              dateFormat.format(DateTime.now()),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          DefaultElevatedButton(
            label: 'Add',
            onPressed: addTask,
          ),
        ],
      ),
    );
  }

  void addTask() {}
}
