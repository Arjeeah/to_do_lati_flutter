import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog(
      {super.key,
      required this.titleController,
      required this.subtitleController,
      required this.formKey,
      required this.onTap});
  final TextEditingController titleController;
  final TextEditingController subtitleController;
  final GlobalKey<FormState> formKey;
  final Function onTap;

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Form(
            key: widget.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Add new task",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: widget.titleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Pleace Enter Task Title";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "Enter title here!",
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: widget.subtitleController,
                  decoration: const InputDecoration(
                      hintText: "Enter title here!",
                      border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          widget.titleController.clear();
                          widget.subtitleController.clear();
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel",
                            style: TextStyle(color: Colors.red))),
                    ElevatedButton(
                        onPressed: () {
                          if (widget.formKey.currentState!.validate()) {
                            widget.onTap();
                          }
                        },
                        child: const Text("Add"))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
