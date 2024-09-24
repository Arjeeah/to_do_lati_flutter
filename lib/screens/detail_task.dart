import 'package:flutter/material.dart';
import 'package:to_do_lati/models/task_model.dart';

class DetailTask extends StatefulWidget {
  const DetailTask({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  State<DetailTask> createState() => _DetailTaskState();
}

class _DetailTaskState extends State<DetailTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("task detail"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Text(
                "tilte: ${widget.taskModel.title} ",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Icon(widget.taskModel.iscompleted
                  ? (Icons.check)
                  : Icons.cancel_presentation),
              if (widget.taskModel.subtitle!=null)
                Text(
                  "subtitle: ${widget.taskModel.subtitle} ",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                )
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
