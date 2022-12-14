import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoriverpod/todoLogic/todoproviders.dart';

class TaskEditPage extends ConsumerWidget {
  const TaskEditPage({super.key, required this.id, required this.tasktitle});
  final String tasktitle;
  final String id;
  @override
  Widget build(BuildContext context, ref) {
    TextEditingController editTitleController =
        TextEditingController(text: tasktitle);
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(title: const Text("Edit Task")),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: TextField(
            style: TextStyle(color: Colors.purple.shade50),
            controller: editTitleController,
          ),
        ),
        TextButton(
          style:
              TextButton.styleFrom(backgroundColor: Colors.deepPurple.shade50),
          onPressed: () {
            ref
                .read(todoProvider.notifier)
                .editTodo(id, editTitleController.text);
            Navigator.pop(context);
          },
          child: const Text(
            "Update task",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ]),
    );
  }
}
