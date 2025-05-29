import 'package:do_it/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/project_model.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final df = DateFormat('d-M-yyyy');
    final duration = project.endDate != null && project.startDate != null
        ? project.endDate!.difference(project.startDate!).inDays
        : 0;

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset("assets/images/liberty.png"),
                const SizedBox(width: 12),
                Text(
                  project.name,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: font,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 154, 73, 1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    '${duration}d',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: font,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: screenHeight * 0.017),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start ',
                      style: TextStyle(
                        color: Colors.red,
                        fontFamily: font,
                        fontWeight: FontWeight.w600,
                        fontSize: 8,
                      ),
                    ),
                    Text(
                      df.format(project.startDate!),
                      style: TextStyle(
                        color: Color.fromRGBO(78, 78, 78, 1),
                        fontFamily: font,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'End ',
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: font,
                        fontWeight: FontWeight.w600,
                        fontSize: 8,
                      ),
                    ),
                    Text(
                      df.format(project.endDate!),
                      style: TextStyle(
                        color: Color.fromRGBO(78, 78, 78, 1),
                        fontFamily: font,
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.white,
                    border: Border.all(
                      color: color, // border color
                      // border thickness
                    ),
                  ),
                  child: Text(
                    "Add Task",
                    style: TextStyle(
                      fontFamily: font,
                      color:
                          color, // assuming you want white text on colored bg
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            // duration badge
            const SizedBox(width: 8),

            // Add Task button
          ],
        ),
      ),
    );
  }
}
