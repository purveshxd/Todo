import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoriverpod/todoLogic/todomodel.dart';
import 'package:todoriverpod/todoLogic/todoproviders.dart';
import 'package:uuid/uuid.dart';

class DialogBox extends ConsumerWidget {
  const DialogBox({
    Key? key,
    required this.hintText,
    required this.buttonText,
    required this.uuid,
  }) : super(key: key);

  final Uuid uuid;
  final String hintText;
  final String buttonText;

  @override
  Widget build(BuildContext context, ref) {
    void addTodo(TextEditingController titleController) {
      ref.read(todoProvider.notifier).addTodo(TodoModel(
            id: uuid.v1(),
            title: titleController.text,
            isCompleted: false,
          ));
      Navigator.of(context).pop();
      titleController.clear();
    }

    TextEditingController titleController = TextEditingController();
    return AlertDialog(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.grey.shade700,
      actionsPadding: const EdgeInsets.all(20),
      titlePadding: const EdgeInsets.symmetric(vertical: 20),
      title: Center(
          child: Text(
        "Add task",
        style: TextStyle(color: Colors.purple.shade50),
      )),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, right: 10, left: 10),
          child: TextField(
            style: TextStyle(color: Colors.purple.shade100),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple.shade100),
              ),
              hintStyle: TextStyle(color: Colors.purple.shade50),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
            controller: titleController,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade50),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.red.shade300, fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade50),
              onPressed: () => addTodo(titleController),
              child: Text(
                buttonText,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
