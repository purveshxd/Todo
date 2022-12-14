import 'package:flutter/material.dart';
import 'package:todoriverpod/widgets/customdialogbox.dart';
import 'package:uuid/uuid.dart';

class FloatingTaskAdd extends StatelessWidget {
  const FloatingTaskAdd({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final Uuid uuid;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return DialogBox(
                hintText: "Enter task",
                buttonText: "Submit",
                uuid: uuid,
              );
            },
          );
        },
        child: const Icon(
          Icons.add_rounded,
          size: 30,
        ));
  }
}
