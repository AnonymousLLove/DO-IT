import '../models/project_model.dart';

class ProjectsController {
  List<Project> getProjects() {
    // sample data; replace with your backend fetch
    return List.generate(6, (_) {
      final start = DateTime(2022, 3, 27);
      final end = DateTime(2022, 3, 31);
      return Project(name: 'Liberty Pay', startDate: start, endDate: end);
    });
  }
}
