class Task {
  final String title;
  final List<String> members; // Use image URLs or asset paths
  final String startDate;
  final String endDate;
  final int progress;
  final String duration;

  Task({
    required this.title,
    required this.members,
    required this.startDate,
    required this.endDate,
    required this.progress,
    required this.duration,
  });
}
