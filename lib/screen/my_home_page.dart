import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_bloc/bloc/todo_bloc.dart';
import 'package:todo_app_bloc/models/todo_model.dart';

import '../component/add_task_screen.dart';
import '../component/edit_task_screen.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});



  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state){
          List<TodoModel> list = state.todoModel;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (_, index){
                var data = list[index];

                return Padding(
                    padding: const EdgeInsets.all(10),
                  child: Card(
                    elevation: 10,
                    child: ListTile(
                      onTap: (){
                        _nameController.text = data.name ?? "";
                        _emailController.text = data.email ?? "";
                            showDialog(context: context, builder: (_){

                          return AlertDialog(

                            title: const Center(child: Text("Update  Data")),
                            content:  Column(
                              mainAxisSize:  MainAxisSize.min,
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
                                          // id:  Random().nextInt(1000),
                                          name: _nameController.text,
                                          email: _emailController.text,
                                          dateTime: DateFormat().add_jm().format(DateTime.now())
                                      );
                                      context.read<TodoBloc>().add(UpdateTask(todoModel: todoList));
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Update"))
                              ],
                            )
                          );
                        });
                      },
                      title: Text(data.name.toString()),
                      trailing: InkWell(
                        onTap: (){
                          var todoList =
                          TodoModel(
                            id:  data.id,
                          );

                          context.read<TodoBloc>().add(RemoveTask(todoModel: todoList));
                          // Navigator.pop(context);
                        },
                        child: Icon(Icons.delete),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.email.toString()),
                          Text(data.dateTime.toString()),
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return const AlertDialog(
                  title: Center(child: Text("Task  Data")),
                  content: SingleChildScrollView(
                    child: DialogScreen(),
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
