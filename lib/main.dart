import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoriverpod/widgets/appV_bar.dart';
import 'package:todoriverpod/widgets/customdialogbox.dart';
import 'package:todoriverpod/widgets/floatingButton.dart';
import 'package:todoriverpod/widgets/task_list_view.dart';
import 'package:todoriverpod/todoLogic/todomodel.dart';
import 'package:todoriverpod/todoLogic/todoproviders.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var uuid = const Uuid();

    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: appBar(),
      body: const TaskListView(),
      floatingActionButton: FloatingTaskAdd(uuid: uuid),
    );
  }
}
