import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/bloc/todo_bloc.dart';
import 'package:todo_app_bloc/models/todo_model.dart';

import '../component/add_task_screen.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});



  @override
  Widget build(BuildContext context) {
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
                        showDialog(context: context, builder: (_){
                          return AlertDialog(
                            title: Center(child: Text("Update  Data")),

                          );
                        });
                      },
                      title: Text(data.name.toString()),
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
                return AlertDialog(
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
