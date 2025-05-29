import 'package:do_it/views/screens/add_task_view.dart';
import 'package:do_it/views/screens/create_account.dart';
import 'package:do_it/views/screens/create_project_view.dart';
import 'package:do_it/views/screens/create_task_view.dart';
import 'package:do_it/views/screens/dashboard_view.dart';
import 'package:do_it/views/screens/projects_view.dart';
import 'package:do_it/views/screens/sign_in.dart';
import 'package:flutter/material.dart';
import '../views/screens/welcome_screen.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String signup = '/signup';
  static const String signin = '/signin';
  static const String dashboard = '/dashboard';
  static const String createProject = '/createProject';
  static const String projectView = '/projectView';
  static const String taskView = '/taskView';
  static const String createTask = '/createTask';

  static Map<String, WidgetBuilder> routes = {
    welcome: (context) => const WelcomeScreen(),
    signup: (context) => const CreateAccountView(),
    signin: (context) => const SignInView(),
    dashboard: (context) => DashboardView(),
    createProject: (context) => const CreateProjectView(),
    projectView: (context) => ProjectsView(),
    taskView: (context) => AddTaskView(),
    createTask: (context) => const CreateTaskView(),
  };
}
