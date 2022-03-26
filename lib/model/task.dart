class Task {
  String name;
  String description;
  bool isDone;

  Task({
    required this.isDone,
    required this.name,
    required this.description,
  });
  void isDoneToggle() {
    isDone = !isDone;
  }
}
