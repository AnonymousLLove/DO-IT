import 'package:do_it/config/constants.dart';

import 'package:do_it/controllers/dashboard_controller.dart';
import 'package:do_it/routes/app_routes.dart';
import 'package:do_it/views/widgets/create_project_task_popup.dart';

import 'package:do_it/views/widgets/dashboard_bottom_nav.dart';
import 'package:do_it/views/widgets/stat_card.dart';
import 'package:do_it/views/widgets/task_card.dart';

import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  final DashboardController controller = DashboardController();

  DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = controller.getTasks();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hi Dexter",
                          style: TextStyle(
                            fontFamily: font,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(243, 250, 255, 1),
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/images/notification.png",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Welcome onboard",
                      style: TextStyle(
                        fontFamily: font,
                        fontSize: 12,
                        color: color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
          
                    // Stat cards
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.projectView),
                          child: StatCard(
                            icon: Icons.check,
                            title: 'Projects',
                            count: 14,
                            color: Colors.orange,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.taskView),
                          child: StatCard(
                            icon: Icons.assignment,
                            title: 'Tasks',
                            count: 24,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        StatCard(
                          icon: Icons.done,
                          title: 'Completed Task',
                          count: 12,
                          color: Colors.green,
                        ),
                        StatCard(
                          icon: Icons.close,
                          title: 'Overdue Task',
                          count: 2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 20),
                  color: Color.fromRGBO(248, 248, 248, 1),
          
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Task in Progress",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: font,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                AppRoutes.taskView,
                              ),
          
                              child: Text(
                                "See all",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: color,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: font,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
          
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: tasks.length,
                          itemBuilder: (context, index) =>
                              TaskCard(task: tasks[index], bp: color),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      

      floatingActionButton: Container(
        width: 55,
        height: 55,
        decoration: const BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 2))],
        ),

        child: IconButton(
          icon: const Icon(Icons.add, color: Colors.white, size: 40),
          onPressed: () {
CreateProjectTaskPopup.show(context);

          },
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: const DashboardBotttomNav(),
    );
  }
}
