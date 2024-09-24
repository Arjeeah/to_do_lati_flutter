import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_lati/models/task_model.dart';
import 'package:to_do_lati/providers/dark_mode_provider.dart';
import 'package:to_do_lati/providers/task_provider.dart';
import 'package:to_do_lati/widgets/cards/task_card.dart';
import 'package:to_do_lati/widgets/clickables/drawer_tile.dart';
import 'package:to_do_lati/widgets/dialog/add_task_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskSubTitleController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<DarkModeProvider>(builder: (context, darkModeConsumer, _) {
      return Consumer<TaskProvider>(builder: (context, tasksConsumer, _) {
        return Scaffold(
          drawer: Drawer(
              child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                DrawerTile(
                    text: darkModeConsumer.isDark ? "Light Mode" : "Dark Mode",
                    ontap: () {
                      Provider.of<DarkModeProvider>(context, listen: false)
                          .switchMode();
                    },
                    icon: darkModeConsumer.isDark
                        ? Icons.light_mode
                        : Icons.dark_mode),
              ]),
            ),
          )),

          // ignore: deprecated_member_use
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AddTaskDialog(
                        titleController: taskTitleController,
                        subtitleController: taskSubTitleController,
                        formKey: formKey,
                        onTap: () {
                          Provider.of<TaskProvider>(context, listen: false)
                              .addTask(TaskModel(
                                  title: taskTitleController.text,
                                  createdat: DateTime.now(),
                                  subtitle: taskSubTitleController.text.isEmpty
                                      ? null
                                      : taskSubTitleController.text));
                          taskSubTitleController.clear();
                          taskTitleController.clear();
                          Navigator.pop(context);
                        });
                  });
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            title: const Text("ToDo"),
            // ignore: deprecated_member_use
          ),
          body: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: const [
                      Tab(
                        text: "wite",
                      ),
                      Tab(
                        text: "done",
                      )
                    ],
                    labelColor:
                        darkModeConsumer.isDark ? Colors.white : Colors.black87,
                  ),
                  Expanded(
                      child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                        ListView.builder(
                          padding: const EdgeInsets.all(24),
                          itemCount: tasksConsumer.tasks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return tasksConsumer.tasks[index].iscompleted
                                ? const SizedBox()
                                : TaskCard(
                                    taskModel: tasksConsumer.tasks[index],
                                    ontap: () {
                                      Provider.of<TaskProvider>(context,
                                              listen: false)
                                          .switchValue(
                                              tasksConsumer.tasks[index]);
                                    });
                          },
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.all(24),
                          itemCount: tasksConsumer.tasks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return !tasksConsumer.tasks[index].iscompleted
                                ? const SizedBox()
                                : TaskCard(
                                    taskModel: tasksConsumer.tasks[index],
                                    ontap: () {
                                      Provider.of<TaskProvider>(context,
                                              listen: false)
                                          .switchValue(
                                              tasksConsumer.tasks[index]);
                                    });
                          },
                        ),
                      ]))
                ],
              )),
        );
      });
    });
  }
}
