import '../models/project_model.dart';

class CreateProjectController {
  final Project project = Project();

  void setName(String name) => project.name = name;
  void setStartDate(DateTime date) => project.startDate = date;
  void setEndDate(DateTime date) => project.endDate = date;
  void addMember(String memberId) => project.assignedMembers.add(memberId);
  void addTag(String tag) => project.tags.add(tag);
  void setDescription(String desc) => project.description = desc;

  bool validate() {
    return project.name.isNotEmpty &&
        project.startDate != null &&
        project.endDate != null;
  }
}
