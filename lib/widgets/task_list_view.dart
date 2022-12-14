import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todoriverpod/todoLogic/todoproviders.dart';
import 'package:todoriverpod/widgets/customdialogbox.dart';
import 'package:todoriverpod/widgets/task_edit_page.dart';
import 'package:uuid/uuid.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var dataList = ref.watch(todoProvider);

        return ListView(
          children: [
            // DialogBox(titleController: titleController, uuid: uuid),
            for (final tasks in dataList)
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                child: Slidable(
                  endActionPane:
                      ActionPane(motion: const StretchMotion(), children: [
                    SlidableAction(
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: Colors.deepPurple.shade500,
                      icon: Icons.edit_rounded,
                      onPressed: (context) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return TaskEditPage(
                              tasktitle: tasks.title,
                              id: tasks.id,
                            );
                          },
                        ));
                      },
                    ),
                  ]),
                  startActionPane:
                      ActionPane(motion: const StretchMotion(), children: [
                    SlidableAction(
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: Colors.red.shade400,
                      icon: Icons.delete_rounded,
                      onPressed: (context) {
                        ref.read(todoProvider.notifier).removeTodo(tasks.id);
                      },
                    ),
                  ]),
                  child: CheckboxListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: tasks.isCompleted
                        ? Colors.grey
                        : Colors.deepPurple.shade200,
                    onChanged: (value) {
                      ref.read(todoProvider.notifier).toggleTodo(tasks.id);
                    },
                    value: tasks.isCompleted,
                    title: Text(
                      tasks.title,
                      style: TextStyle(
                        decoration: tasks.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
