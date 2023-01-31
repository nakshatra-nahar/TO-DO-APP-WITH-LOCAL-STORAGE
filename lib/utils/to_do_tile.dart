// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  Function(BuildContext)? deleteFunction;
  final String taskName;
  final bool value;
  void Function(bool?)? onChanged;
  ToDoTile(
      {super.key,
      required this.taskName,
      required this.value,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
              backgroundColor: Colors.redAccent,
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.black87,
            ),
            Text(
              taskName,
              style: TextStyle(
                  decoration: !value
                      ? TextDecoration.none
                      : TextDecoration.lineThrough),
            )
          ]),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
