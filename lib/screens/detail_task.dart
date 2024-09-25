import 'package:flutter/material.dart';
import 'package:to_do_lati/models/task_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        title: Text(AppLocalizations.of(context)!.taskdetails),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Text(
                "${AppLocalizations.of(context)!.title}: ${widget.taskModel.title} ",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Icon(widget.taskModel.iscompleted
                  ? (Icons.check)
                  : Icons.cancel_presentation),
              if (widget.taskModel.subtitle != null)
                Text(
                  "${AppLocalizations.of(context)!.subtitle}: ${widget.taskModel.subtitle} ",
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
