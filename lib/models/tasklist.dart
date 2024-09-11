class Task {
  final String title;
  final String subtitle;
  final bool status;
  Task({
    required this.title,
    required this.subtitle,
    this.status = false,
  });
  // to json
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'status': status,
    };
  }

  // from json
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      subtitle: json['subtitle'],
      status: json['status'],
    );
  }
  @override
  String toString() {
    return 'Task{title: $title, subtitle: $subtitle, status: $status}';
  }
}
