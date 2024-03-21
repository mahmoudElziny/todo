import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/firebase_utils.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/tabs/tasks/default_elevated_button.dart';
import 'package:todo/tabs/tasks/default_text_form_field.dart';
import 'package:todo/tabs/tasks/tasks_provider.dart';

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
                initialDate: selectedDate,
              );
              if (dateTime != null) {
                selectedDate = dateTime;
                setState(() {});
              }
            },
            child: Text(
              dateFormat.format(selectedDate),
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

  void addTask() {
    FirebaseUtils.addTaskToFirebase(
      TaskModel(
        title: titleController.text,
        description: descriptionController.text,
        dateTime: selectedDate,
      ),
    ).timeout(const Duration(milliseconds: 500), onTimeout: () {
      Provider.of<TasksProvider>(context, listen: false).getTasks();
      Navigator.of(context).pop();
      Fluttertoast.showToast(
        msg: 'task added successfully',
        toastLength: Toast.LENGTH_SHORT,
      );
    }).catchError((error) {
      Navigator.of(context).pop();
      Fluttertoast.showToast(
        msg: 'something went wrong',
        toastLength: Toast.LENGTH_SHORT,
      );
    });
  }
}
