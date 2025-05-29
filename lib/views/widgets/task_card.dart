import 'package:do_it/config/constants.dart';
import 'package:do_it/models/task_model.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final Color bp;

  const TaskCard({super.key, required this.task, required this.bp});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    color: Color.fromRGBO(55, 55, 55, 1),
                    fontSize: 14,
                    fontFamily: font,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: bp,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Text(
                    task.duration,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: font,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Team members',
                      style: TextStyle(
                        color: Color.fromRGBO(78, 78, 78, 1),
                        fontSize: 10,
                        fontFamily: font,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Row(
                          children: task.members
                              .map(
                                (img) => Padding(
                                  padding: const EdgeInsets.only(right: 9),
                                  child: CircleAvatar(
                                    radius: 14,
                                    backgroundImage: AssetImage(img),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 16,
                          color: Colors.redAccent,
                        ),
                        const SizedBox(width: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Start',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                                fontSize: 7,
                                fontFamily: font,
                              ),
                            ),
                            Text(
                              task.startDate,
                              style: TextStyle(
                                color: Color.fromRGBO(78, 78, 78, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                fontFamily: font,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'End',
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                                fontSize: 7,
                                fontFamily: font,
                              ),
                            ),
                            Text(
                              task.endDate,
                              style: TextStyle(
                                color: Color.fromRGBO(78, 78, 78, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                fontFamily: font,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: CircularProgressIndicator(
                        value: task.progress / 100,
                        color: Colors.green,
                        strokeWidth: 2,
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ),
                    Text(
                      '${task.progress}%',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: font,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
