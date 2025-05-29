import 'package:do_it/config/constants.dart';
import 'package:do_it/controllers/task_controller.dart';
import 'package:do_it/views/widgets/bottom_nav.dart';
import 'package:do_it/views/widgets/task_card.dart';
import 'package:flutter/material.dart';

class AddTaskView extends StatelessWidget {
  final TaskController controller = TaskController();

  AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = controller.getTasks();
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Add task',
                  style: TextStyle(
                    fontFamily: font,
                    color: Colors
                        .black, // assuming you want white text on colored bg
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) => TaskCard(
                  task: tasks[index],
                  bp: const Color.fromRGBO(88, 2, 140, 1),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
