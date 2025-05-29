import 'package:flutter/material.dart';
import 'package:do_it/routes/app_routes.dart';
import 'package:do_it/config/constants.dart';

class CreateProjectTaskPopup {
  static void show(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (ctx) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            width: screenWidth*0.5,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, AppRoutes.createProject);
                      },
                      child: Text(
                        "Create Project",
                        style: TextStyle(
                          fontFamily: font,
                          fontSize: 12,
                          color: Colors.black
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, AppRoutes.createTask);
                      },
                      child: Text(
                        "Create Task",
                        style: TextStyle(
                          fontFamily: font,
                          fontSize: 12,
                          color
                              : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
