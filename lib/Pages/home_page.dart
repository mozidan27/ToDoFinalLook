import 'package:flutter/material.dart';
import 'package:todo/utils/dialog_box.dart';
import 'package:todo/utils/to_do_til.dart';

class HomePage extends StatefulWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();
  // list of todo tasks
  List toDoList = [
    ['Your Task Here', false]
  ];

  // check was tapped

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // save new task

  void saveNewTask() {
    setState(
      () {
        toDoList.add([_controller.text, false]);
      },
    );
    Navigator.of(context).pop();
    _controller.clear();
  }

  void cancelTheTask() {
    setState(
      () {
        Navigator.of(context).pop();
      },
    );
    _controller.clear();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: cancelTheTask,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffafbfe),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 5,
              ),
              child: Text(
                "What's up, ${widget.userName}!",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Color(0xff1e2f5d),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.only(right: 36, left: 36, top: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "TODAY'S TASKS",
                        style: TextStyle(
                          color: Color(0xff9ba6c4),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: toDoList.length,
                  itemBuilder: (context, index) {
                    return ToDoTile(
                      taskName: toDoList[index][0],
                      taskCompleted: toDoList[index][1],
                      onChanged: (value) => checkBoxChanged(value, index),
                      deleteFunction: (context) => deleteTask(index),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: createNewTask,
        backgroundColor: const Color(0xff6750a4),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
