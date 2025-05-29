import 'package:do_it/config/constants.dart';
import 'package:do_it/controllers/project_controller.dart';
import 'package:do_it/routes/app_routes.dart';
import 'package:do_it/views/widgets/bottom_nav.dart';
import 'package:do_it/views/widgets/project_card.dart';
import 'package:flutter/material.dart';

class ProjectsView extends StatelessWidget {
  final ProjectsController ctrl = ProjectsController();

  ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = ctrl.getProjects();

    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(248, 248, 248, 1),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Color.fromRGBO(
                            18,
                            24,
                            38,
                            1,
                          ), // Change icon color as needed
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.createProject);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        border: Border.all(
                          color: color, // border color
                          // border thickness
                        ),
                      ),
                      child: Text(
                        "Create Project",
                        style: TextStyle(
                          fontFamily: font,
                          color:
                              color, // assuming you want white text on colored bg
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                "Projects",
                style: TextStyle(
                  fontFamily: font,
                  color: Colors
                      .black, // assuming you want white text on colored bg
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: projects.length,
                  itemBuilder: (ctx, i) => ProjectCard(project: projects[i]),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
