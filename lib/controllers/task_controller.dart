import 'package:do_it/models/task_model.dart';

class TaskController {
  List<Task> getTasks() {
    return List.generate(
      4,
      (index) => Task(
        title: 'Liberty Pay Loan App',
        members: [
          'assets/images/task_picture1.png',
          'assets/images/task_picture2.png',
          'assets/images/task_picture3.png',
        ],
        startDate: '27-3-2022',
        endDate: '27-3-2022',
        progress: 40,
        duration: '4d',
      ),
    );
  }
}
