import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoriverpod/todoLogic/todomodel.dart';
import 'package:uuid/uuid.dart';

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  var uuid = const Uuid();
  TodoNotifier()
      : super([
          TodoModel(
              title: "This is a todo app made with riverpod",
              isCompleted: false,
              id: "1"),
          TodoModel(
              title: "Add new task by using the button at the bottom",
              isCompleted: false,
              id: "2"),
          TodoModel(
              title: "Swipe left to edit task and right to delete the task",
              isCompleted: false,
              id: "3")
        ]);

// get todolist
  // Future<List<TodoModel>> getTodo() async {
  //   var response = await rootBundle.loadString("assets/todoSaved.json");
  //   // debugPrint(response);
  //   var decodedBody = jsonDecode(se);
  //   var finalResult =
  //       decodedBody.map<TodoModel>((json) => todoFromJson(json)).toList();
  //   debugPrint("$finalResult");
  //   for (var element in finalResult) {
  //     // debugPrint(element);
  //     state = state + element;
  //   }
  //   debugPrint(state.toString());
  //   return state;
  // }

  // add todo
  void addTodo(TodoModel todo) {
    state = [...state, todo];
  }

  // toggle completed
  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(isCompleted: !todo.isCompleted)
        else
          todo,
    ];
  }

// remove todo
  void removeTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id != id) todo,
    ];
  }

  // edit todo
  void editTodo(String id, String newtitle) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(title: newtitle),
    ];
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<TodoModel>>(
  (ref) {
    return TodoNotifier();
  },
);
