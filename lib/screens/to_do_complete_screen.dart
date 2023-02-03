import 'package:flutter/material.dart';
import 'package:to_do_app_second/model/to_do_model.dart';

import '../utils/constant.dart';

class ToDoCompleteScreen extends StatefulWidget {
  const ToDoCompleteScreen({Key? key}) : super(key: key);

  @override
  State<ToDoCompleteScreen> createState() => _ToDoCompleteScreenState();
}

class _ToDoCompleteScreenState extends State<ToDoCompleteScreen> {
  // List<ToDoListModel> listData = [];
  ToDoListModel toDoListModel = ToDoListModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do Complete List'),
      ),
      body: listofcompletedata.todoList!.isEmpty
          ? const Center(
              child: Text(
                "No Task",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ListView.separated(
              itemCount: listofcompletedata.todoList!.length,
              padding: const EdgeInsets.symmetric(vertical: 15),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) {
                final item = listofcompletedata.todoList![index];
                return ListTile(
                  style: ListTileStyle.drawer,
                  tileColor: Colors.grey.shade400,
                  title: Text('Title: ${item.title}'),
                  subtitle: Text('Description: ${item.description}'),
                  trailing: Text('Date: ${item.date}\nTime: ${item.time}'),
                );
              },
            ),
    );
  }
}
