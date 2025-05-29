class Project {
  String name;
  DateTime? startDate;
  DateTime? endDate;
  List<String> assignedMembers;
  List<String> tags;
  String description;

  Project({
    this.name = '',
    this.startDate,
    this.endDate,
    List<String>? assignedMembers,
    List<String>? tags,
    this.description = '',
  }) : assignedMembers = assignedMembers ?? [],
       tags = tags ?? [];
}
