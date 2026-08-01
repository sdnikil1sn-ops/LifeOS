class DashboardStats {
  final int totalTasks;
  final int completedTasks;
  final int pendingTasks;
  final int streak;

  const DashboardStats({
    required this.totalTasks,
    required this.completedTasks,
    required this.pendingTasks,
    required this.streak,
  });

  double get completionPercentage {
    if (totalTasks == 0) return 0;
    return completedTasks / totalTasks;
  }
}