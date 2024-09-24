import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart';
import 'package:to_do_lati/models/task_model.dart';
import 'package:to_do_lati/providers/task_provider.dart';
import 'package:to_do_lati/screens/detail_task.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskModel, required this.ontap});
  final TaskModel taskModel;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailTask(taskModel: taskModel)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.grey),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Provider.of<TaskProvider>(context, listen: false)
                        .deleteTask(taskModel);
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      taskModel.title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    if (taskModel.subtitle != null)
                      Text(taskModel.title,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey)),
                    Text(
                      taskModel.iscompleted
                          ? DateFormat("EEE-dd-MMM-yyyy")
                              .format(DateTime.parse(
                                  taskModel.createdat.toIso8601String()))
                              .replaceAll("-", ",")
                          : format(taskModel.createdat),
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    )
                  ],
                ),
                Checkbox(
                  value: taskModel.iscompleted,
                  onChanged: (check) {
                    ontap();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
