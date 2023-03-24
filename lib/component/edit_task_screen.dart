import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_bloc/bloc/todo_bloc.dart';

import '../models/todo_model.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: "Name"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: _emailController,
            decoration: const InputDecoration(hintText: "Email"),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              var todoList =
              TodoModel(
                  id:  Random().nextInt(1000),
                  name: _nameController.text,
                  email: _emailController.text,
                  dateTime: DateFormat().add_jm().format(DateTime.now())
              );
              context.read<TodoBloc>().add(AddTask(todoModel: todoList));
              Navigator.pop(context);
            },
            child: const Text("Submit"))
      ],
    );
  }
}
